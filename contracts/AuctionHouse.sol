pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

import "./tokens/ArtPieceToken.sol";

contract AuctionHouse is Ownable {
  using SafeMath for uint256;

  event Started(uint256 tokenId, uint256 startingPrice, uint256 endTime);
  event Ended(uint256 tokenId, uint256 price, uint256 endTime);

  struct Auction {
    uint256 tokenId;
    uint256 startingPrice;
    uint256 endTime;
  }

  uint public constant AUCTION_LENGTH = 86400; // 24 hours
  Auction public auction;

  // verifies that an auction is not already in progress
  modifier canStart() {
    require(auction.endTime == 0, "Auction is already in progress");
    _;
  }

  function end() external onlyOwner {
    emit Ended(auction.tokenId, getCurrentPrice(), now);
    delete auction;
  }

  function start(uint256 tokenId) external canStart onlyOwner {
    uint256 endTime = now + AUCTION_LENGTH;
    uint256 startingPrice = getStartingPrice();

    auction = Auction({
      tokenId: tokenId,
      endTime: endTime, // solhint-disable-line not-rely-on-time
      startingPrice: startingPrice
    });

    emit Started(tokenId, startingPrice, endTime);
  }

  function getStartingPrice() public pure returns (uint256) {
    return 10 ** 18;
  }

  function getCurrentPrice() public view returns (uint256) {
    if (auction.endTime == 0) {
      return 0;
    }

    uint256 startTime = auction.endTime - AUCTION_LENGTH;
    uint256 elapsed = now - startTime;

    // Price decays linearly, reaching 0 at endTime
    return getStartingPrice().sub(getStartingPrice().mul(elapsed).div(AUCTION_LENGTH));
  }

  function getAuction() public view returns (uint256, uint256, uint256) {
    return (
      auction.tokenId,
      getCurrentPrice(),
      auction.endTime
    );
  }
}
