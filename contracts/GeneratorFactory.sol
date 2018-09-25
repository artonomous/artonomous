pragma solidity ^0.4.18;

import "zos-lib/contracts/upgradeability/UpgradeabilityProxyFactory.sol";

import "./GeneratorRegistry.sol";
import "./Generator.sol";

/**
 * @title Base Factory contract for creating Generator contracts
 */
contract GeneratorFactory is UpgradeabilityProxyFactory {
  GeneratorRegistry public registry;
  address public implementation;

  constructor(GeneratorRegistry _registry, address _implementation) public {
    registry = _registry;
    implementation = _implementation;
  }

  function createGenerator(string name, string sourceUri) public {
    Generator generator = Generator(this.createProxy(registry, implementation));
    registry.addGenerator(generator);
    generator.initialize(registry, name, msg.sender, sourceUri);
  }
}
