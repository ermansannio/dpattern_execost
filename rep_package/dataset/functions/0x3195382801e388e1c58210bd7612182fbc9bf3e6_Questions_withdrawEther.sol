contract Questions {
function withdrawEther() external onlyOwner {
        owner.transfer(ownerBalance);
        ownerBalance = 0;
    }
}