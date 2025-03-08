import { ethers } from "hardhat";

async function main() {
  console.log("Deploying Kanon contract...");

  // Get the contract factory
  const Kanon = await ethers.getContractFactory("Kanon");

  // Deploy the contract
  const kanon = await Kanon.deploy();
  const tx = await kanon.waitForDeployment();
  console.log("Kanon contract deployed to:", await tx.getAddress());
}

// Execute the deployment
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }); 