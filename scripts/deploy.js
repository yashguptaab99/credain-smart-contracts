const hre = require("hardhat");

async function main() {
    console.log("Deploying Implementation CredainPayments...");
    const CredainPayments = await (
        await hre.ethers.getContractFactory("CredainPayments")
    ).deploy(
        "0x6407df3FB995418bf9118f523d4Be4551283069a",
        "0xfd6C0EDf95eafCf42457e565BF07c38C4fC17a14",
        "0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE",
        hre.ethers.utils.parseEther("2")
    );
    await CredainPayments.deployed();
    console.log("Deployed Implementation", CredainPayments.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
