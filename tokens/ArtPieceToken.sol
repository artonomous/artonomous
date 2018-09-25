pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract ArtPieceToken is ERC721Token, Ownable {

  mapping (uint256 => address) generators;

  constructor(string _name, string _symbol) ERC721Token(_name, _symbol) public {
    name_ = _name;
    symbol_ = _symbol;
  }

  function _setGenerator(uint256 _tokenId, address _generator) internal {
    generators[_tokenId] = _generator;
  }

  function mint(address _to, uint256 _tokenId, address _generator) onlyOwner public returns (uint) {
    _mint(_to, _tokenId);
    _setGenerator(_tokenId, _generator);

    return _tokenId;
  }

  function getGenerator(uint256 tokenId) public view returns (address) {
    return generators[tokenId];
  }
}
