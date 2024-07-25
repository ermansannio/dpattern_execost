contract Convert {
function setToContractAddr(address _addr) public onlyOwner {
        toContractAddr = _addr;
    }
}