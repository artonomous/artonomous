const time = require("./helpers/increaseTime");

const ArtPieceToken = artifacts.require("ArtPieceToken");
const AuctionHouse = artifacts.require("AuctionHouse");

contract("AuctionHouse", accounts => {
  let artPieceToken, auctionHouse;

  beforeEach(async () => {
    artPieceToken = await ArtPieceToken.new("ArtPieceToken", "ART");
    auctionHouse = await AuctionHouse.new(artPieceToken.address);
    await artPieceToken.transferOwnership(auctionHouse.address);
  });

  describe("start()", () => {
    it("successfully starts an auction", async () => {
      await auctionHouse.start("1");
      let auction = await auctionHouse.getAuction.call();
      assert.equal("1", auction[0].toString());
    });
  });
});
