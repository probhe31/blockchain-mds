const CatToken = artifacts.require("CatToken");
const util = require("util");
const fs = require("fs");
const path = require("path");
const writeFile = util.promisify(fs.writeFile);

module.exports = async function(deployer) {
  const catToken = await deployer.deploy(CatToken);
  const addresses = {
    tokenAddress: CatToken.address
  };

  await writeFile(
    path.join(__dirname, "..", "front", "src", "addresses.json"),
    JSON.stringify(addresses)
  );
};
