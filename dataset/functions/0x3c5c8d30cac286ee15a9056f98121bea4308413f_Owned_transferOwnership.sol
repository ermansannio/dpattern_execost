contract Owned {
function transferOwnership(address _newOwner) public onlyOwner {
          newOwner = _newOwner;
      }
}