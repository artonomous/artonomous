var ArtPieceToken = artifacts.require("./ArtPieceToken.sol");

module.exports = async function(deployer) {
  await deployer.deploy(ArtPieceToken, "ArtPieceToken", "ART");
};
