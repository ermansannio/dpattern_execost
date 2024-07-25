contract Swap {
function setDataContract(address _tokenContract) public onlyOwner {
        dataContract = Data(_tokenContract);
    }
}