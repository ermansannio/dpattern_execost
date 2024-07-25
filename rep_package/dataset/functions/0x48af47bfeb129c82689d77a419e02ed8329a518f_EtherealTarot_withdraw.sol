contract EtherealTarot {
function withdraw() public {
    require(msg.sender == creator);
    creator.transfer(address(this).balance);
  }
}