pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

import "./TokenBondingCurve.sol";

contract GeneratorToken is TokenBondingCurve, DetailedERC20 {
  uint256 public constant INITIAL_SUPPLY = 2000000 * (10 ** 18);
  uint256 public constant INITIAL_PRICE = 39 * (10 ** 13);
  uint32 public constant CURVE_RATIO = 150000;
  uint256 public constant INITAL_BALANCE = CURVE_RATIO * INITIAL_SUPPLY * INITIAL_PRICE / (1000000 * 10 ** 18);

  constructor(
    string name,
    string symbol,
    uint8 decimals,
    address _reserveToken
  ) DetailedERC20(name, symbol, decimals) public {
    reserveToken = StandardToken(_reserveToken);
    reserveRatio = CURVE_RATIO;
    totalSupply_ = INITIAL_SUPPLY;
    poolBalance = INITAL_BALANCE;
    gasPrice = 26 * (10 ** 9);
  }
}
