contract Convert {
function setFromContractAddr(address _addr) public onlyOwner {
        fromContractAddr = _addr;
    }
}