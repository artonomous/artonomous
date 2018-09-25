pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

import "./GeneratorFactory.sol";
import "./Generator.sol";

contract GeneratorRegistry {
  // event RegistryEntryEV(address indexed registryEntry, bytes32 indexed eventType);
  event RegistryEntryEVT(bytes32 indexed context, address registryEntry, bytes32 eventType);

  GeneratorFactory public factory;
  StandardToken public token;
  Generator activeGenerator;
  Generator[] generators;

  constructor(StandardToken _token) public {
    token = _token;
  }

  function getActiveGenerator() public view returns (Generator) {
    return activeGenerator;
  }

  function addGenerator(Generator _generator) public {
    activeGenerator = _generator;
    generators.push(_generator);
  }

  function setFactory(GeneratorFactory _factory) public {
    factory = _factory;
  }

  function fireRegistryEvent(bytes32 _eventType) public {
    emit RegistryEntryEVT("ArtGenerator", msg.sender, _eventType);
  }

  function getToken() public view returns (address) {
    return token;
  }
}
