contract question_quest {
function StopGame()
    public
    payable
    {
       require(msg.sender==questionSender);
       msg.sender.transfer(this.balance);
    }
}