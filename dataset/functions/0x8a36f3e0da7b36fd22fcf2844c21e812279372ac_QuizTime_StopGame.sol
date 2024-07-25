contract QuizTime {
function StopGame()
    public payable {
        if (msg.sender==questionSender) {
            msg.sender.transfer(this.balance);
        }
    }
}