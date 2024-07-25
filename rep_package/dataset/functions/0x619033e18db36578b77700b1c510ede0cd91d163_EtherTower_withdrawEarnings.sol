contract EtherTower {
function withdrawEarnings() public {
    uint256 amount = earnings[msg.sender];
    earnings[msg.sender] = 0;
    msg.sender.transfer(amount);
  }
}