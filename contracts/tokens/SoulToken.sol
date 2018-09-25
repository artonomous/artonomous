pragma solidity ^0.4.24;

import "./EthBondingCurve.sol";

contract SoulToken is EthBondingCurve {
  string public constant name = "SoulToken";
  string public constant symbol = "SOL";
  uint8 public constant decimals = 18;

  uint256 public constant INITIAL_SUPPLY = 2000000 * (10 ** 18);
  uint256 public constant INITIAL_PRICE = 39 * (10 ** 13);
  uint32 public constant CURVE_RATIO = 150000;
  uint256 public constant INITAL_BALANCE = CURVE_RATIO * INITIAL_SUPPLY * INITIAL_PRICE / (1000000 * 10 ** 18);

  constructor() public {
    reserveRatio = CURVE_RATIO;
    totalSupply_ = INITIAL_SUPPLY;
    poolBalance = INITAL_BALANCE;
    gasPrice = 26 * (10 ** 9);
  }
}
