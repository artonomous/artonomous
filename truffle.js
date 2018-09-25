const PrivateKeyProvider = require("truffle-privatekey-provider");

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*"
    },
    rinkeby: {
      provider: () =>
        new PrivateKeyProvider(
          "fae00e9036675f2cfdf82307460dab300b6c8a5ac7eae8623a133f51ebab84ad",
          "https://rinkeby.infura.io/"
        ),
      network_id: 4
    }
  }
};
