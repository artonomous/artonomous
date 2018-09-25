const GeneratorRegistry = artifacts.require("./GeneratorRegistry.sol");
const GeneratorContract = artifacts.require("./Generator.sol");
const GeneratorFactory = artifacts.require("./GeneratorFactory.sol");

module.exports = async function(deployer) {
  return deployer.then(async () => {
    const registry = await GeneratorRegistry.deployed();
    await deployer.deploy(GeneratorContract);
    const generator = await GeneratorContract.deployed();
    await deployer.deploy(
      GeneratorFactory,
      registry.address,
      generator.address
    );
    const generatorFactory = await GeneratorFactory.deployed();
    await registry.setFactory(generatorFactory.address);
  });
};
