contract LoeriadeNabidaz {
function pay() payable public {
    require(msg.value==0.0001 ether);
    c = c+1;
    if(c==2) {
      msg.sender.transfer(this.balance);
      c = 0;
    }
  }
}