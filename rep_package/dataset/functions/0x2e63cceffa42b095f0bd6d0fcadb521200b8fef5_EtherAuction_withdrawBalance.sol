contract EtherAuction {
function withdrawBalance() public{
    require (auctionFinalized);

    uint ethToWithdraw = balances[msg.sender];
    if(ethToWithdraw > 0){
      balances[msg.sender] = 0;
      msg.sender.transfer(ethToWithdraw);
    }

  }
}