// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const [deployer, user1, user2, user3] = await ethers.getSigners();
  console.log("Deployer : ",deployer.address);

  const FactoryJerseyOnChain = await hre.ethers.getContractFactory("JerseyOnChain");
  console.log("Deploying Contract . . .")
  const JerseyOnChain = await FactoryJerseyOnChain.deploy();
  await JerseyOnChain.deployTransaction.wait(6)

  await JerseyOnChain.deployed();
  console.log("JerseyOnChain deployed at : ",JerseyOnChain.address);

  console.log("Verifying : ")
  await hre.run("verify:verify", {
    address: JerseyOnChain.address,
    constructorArguments: []
  })
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
