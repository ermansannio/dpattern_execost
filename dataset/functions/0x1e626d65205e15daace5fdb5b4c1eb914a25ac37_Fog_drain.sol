contract Fog {
function drain(uint value) public onlyOwner {
    require(value >= 0 && value < address(this).balance);
    owner.transfer(value);
  }
}