contract CONUNDRUM {
function StopGame()
    public
    payable
    {
       require(msg.sender==questionSender);
       msg.sender.transfer(this.balance);
    }
}