pragma solidity ^0.4.24;

import "./tokens/SoulToken.sol";
import "./tokens/ArtPieceToken.sol";
import "./AuctionHouse.sol";
import "./Generator.sol";
import "./GeneratorRegistry.sol";

contract Artonomous {
  AuctionHouse public auctionHouse;
  GeneratorRegistry public generatorRegistry;
  ArtPieceToken public artPieceToken;
  SoulToken public soulToken;

  // verifies that an auction is already in progress
  modifier canBuy() {
    require(msg.value >= auctionHouse.getCurrentPrice(), "Not enough funds sent to purchase");
    _;
  }

  event Constructed(address creator);

  constructor(AuctionHouse _auctionHouse, GeneratorRegistry _generatorRegistry, ArtPieceToken _artPieceToken, SoulToken _soulToken) public {
    auctionHouse = _auctionHouse;
    generatorRegistry = _generatorRegistry;
    artPieceToken = _artPieceToken;
    soulToken = _soulToken;

    emit Constructed(msg.sender);
  }

  function getInfo() public view returns (address, address, address, address) {
    return (auctionHouse, generatorRegistry, artPieceToken, soulToken);
  }

  function startAuction() public {
    uint256 tokenId = block.number;
    Generator generator = generatorRegistry.getActiveGenerator();
    artPieceToken.mint(this, tokenId, generator);
    auctionHouse.start(tokenId);
  }

  function buyPiece() public canBuy payable {
    uint256 price;
    uint256 tokenId;
    uint256 endTime;
    (tokenId, price, endTime) = auctionHouse.getAuction();

    artPieceToken.transferFrom(this, msg.sender, tokenId);

    auctionHouse.end();

    startAuction();
    
    // Claim art for free
    if (endTime <= now) {
      // Refund if any eth paid
      msg.sender.transfer(msg.value);
      return;
    }

    uint256 remainder = msg.value - price;
     // refund extra value
    if (remainder > 0) {
      msg.sender.transfer(remainder);
    }
  }
}
