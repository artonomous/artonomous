var SoulToken = artifacts.require("./SoulToken.sol");

module.exports = async function(deployer) {
  const gasPrice = 1 * 1e18;
  const reserveRatio = Math.round(1 / 3 * 1000000) / 1000000;
  const ratio = Math.floor(reserveRatio * 1000000);
  await deployer.deploy(SoulToken);
};
