contract BackMeApp {
function toggleFactoryPower() external onlyOwner() { isShutDown = isShutDown == false ? true : false; }
}