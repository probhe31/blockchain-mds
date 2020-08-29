import contract from "truffle-contract";
import getProvider from "utils/getProvider";
import GradientTokenArtifact from "utils/contracts/CatToken.json";
import addresses from "../addresses.json";

const { tokenAddress } = addresses;

export default async function getGradientContractInstance() {
  const gradientTokenContract = contract(GradientTokenArtifact);
  gradientTokenContract.setProvider(getProvider());
  const gradientTokenInstance = await gradientTokenContract.at(tokenAddress);
  return gradientTokenInstance;
}
