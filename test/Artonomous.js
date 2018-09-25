const SoulToken = artifacts.require("SoulToken");
const Artonomous = artifacts.require("Artonomous");
const ArtPieceToken = artifacts.require("ArtPieceToken");
const AuctionHouse = artifacts.require("AuctionHouse");
const GeneratorRegistry = artifacts.require("GeneratorRegistry");
const GeneratorFactory = artifacts.require("GeneratorFactory");
const GeneratorContract = artifacts.require("Generator");

const gasPrice = 1 * 1e18;
const reserveRatio = Math.round((2 / 3) * 1000000) / 1000000;
const ratio = Math.floor(reserveRatio * 1000000);

contract("Artonomous", accounts => {
  let soulToken,
    artPieceToken,
    auctionHouse,
    artonomous,
    generator,
    generatorRegistry,
    generatorFactory;

  beforeEach(async () => {
    artPieceToken = await ArtPieceToken.new("ArtPieceToken", "ART");
    auctionHouse = await AuctionHouse.new(artPieceToken.address);

    soulToken = await SoulToken.new();
    generatorRegistry = await GeneratorRegistry.new(soulToken.address);
    generator = await GeneratorContract.new();
    generatorFactory = await GeneratorFactory.new(
      generatorRegistry.address,
      generator.address
    );
    await generatorRegistry.setFactory(generatorFactory.address);

    await generatorFactory.createGenerator("Generator!!", "generator_uri");

    artonomous = await Artonomous.new(
      auctionHouse.address,
      generatorRegistry.address,
      artPieceToken.address,
      soulToken.address
    );

    await artPieceToken.transferOwnership(artonomous.address);
    await auctionHouse.transferOwnership(artonomous.address);
  });

  describe("startAuction()", () => {
    it("successfully starts an auction", async () => {
      await artonomous.startAuction();
      let auction = await auctionHouse.getAuction.call();
      assert.isAbove(auction[0], 0);
    });
  });
});
