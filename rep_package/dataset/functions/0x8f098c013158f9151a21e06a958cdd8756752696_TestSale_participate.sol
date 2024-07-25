contract TestSale {
function participate(address _recipient) public payable isActive {
    participation[_recipient] = participation[_recipient] + msg.value;
    owner.transfer(msg.value);
  }
}