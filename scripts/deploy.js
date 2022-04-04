const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  console.log(
    "Deploying contracts with the account:",
    deployer.address
  );
  
  const GreeterPromise = await hre.ethers.getContractFactory("Greeter");
  const greeter = await GreeterPromise.deploy("Hello, World!");

  const JTTPromise = await hre.ethers.getContractFactory("MyOwnToken");
  const jtt = await JTTPromise.deploy();

  const CSTPromise = await hre.ethers.getContractFactory("CRMToken");
  const sct = await CSTPromise.deploy();
  
  await greeter.deployed();
  await jtt.deployed();
  await sct.deployed();

  console.log("Greeter deployed to:", greeter.address);
  console.log("JTT deployed to:", jtt.address);
  console.log("Syonet CRM Token deployed to:", sct.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });