contract QurozToken {
function transferOwnership(address _newOwner) public onlyOwner {   //Ownable.sol
    _transferOwnership(_newOwner);
  }
}