const GeneratorRegistry = artifacts.require("./GeneratorRegistry.sol");
const SoulToken = artifacts.require("./SoulToken.sol");

module.exports = async function(deployer) {
  return deployer.then(async () => {
    const soulToken = await SoulToken.deployed();
    await deployer.deploy(GeneratorRegistry, soulToken.address);
  });
};
