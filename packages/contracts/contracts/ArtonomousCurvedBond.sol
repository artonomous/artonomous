pragma solidity ^0.4.24; //solhint-disable-line compiler-fixed

import './EthBondingCurvedToken.sol';

contract ArtonomousCurvedBond is EthBondingCurvedToken('Artonomous SOUL', 18, 'SOUL') {

    /// @dev constructor        Initializes the bonding curve
    /// @param name             The name of the token
    /// @param decimals         The number of decimals to use
    /// @param symbol           The symbol of the token
    /// @param _exponent        The exponent of the curve
    uint exponent;
    constructor() public {
        exponent = 1; // linear curve
    }
}
