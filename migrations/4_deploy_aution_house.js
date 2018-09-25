const AuctionHouse = artifacts.require("./AuctionHouse.sol");
const ArtPieceToken = artifacts.require("./ArtPieceToken.sol");

module.exports = async function(deployer) {
  return deployer.then(async () => {
    const artPieceToken = await ArtPieceToken.deployed();
    await deployer.deploy(AuctionHouse, artPieceToken.address);
  });
};
