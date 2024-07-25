contract EtherBags {
function setTimeout(uint256 _timeout) public onlyContractOwner {
    timeout = _timeout;
  }
}