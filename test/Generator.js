const SoulToken = artifacts.require("SoulToken");
const GeneratorRegistry = artifacts.require("GeneratorRegistry");
const GeneratorFactory = artifacts.require("GeneratorFactory");
const GeneratorContract = artifacts.require("Generator");

const gasPrice = 1 * 1e18;
const reserveRatio = Math.round((2 / 3) * 1000000) / 1000000;
const ratio = Math.floor(reserveRatio * 1000000);

contract("Generators", accounts => {
  let soulToken, generator, generatorRegistry, generatorFactory;

  beforeEach(async () => {
    soulToken = await SoulToken.new();
    generatorRegistry = await GeneratorRegistry.new(soulToken.address);
    generator = await GeneratorContract.new();
    generatorFactory = await GeneratorFactory.new(
      generatorRegistry.address,
      generator.address
    );
    await generatorRegistry.setFactory(generatorFactory.address);
  });

  describe("createGenerator(string name, string sourceUri)", () => {
    it("successfully creates generator", async () => {
      const expectedName = "Generator!!";
      const expectedSourceUri = "ipfs_uri";
      await generatorFactory.createGenerator(expectedName, expectedSourceUri);
      const generatorAddress = await generatorRegistry.getActiveGenerator.call();
      const generatorInstance = await GeneratorContract.at(generatorAddress);
      const generatorData = await generatorInstance.getGenerator.call();

      assert.equal(expectedName, generatorData[0]);
      assert.equal(accounts[0], generatorData[1]);
      assert.equal(expectedSourceUri, generatorData[2]);
    });
  });
});
