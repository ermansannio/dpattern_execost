contract LuckyNumber {
function takeAGuess(uint _myGuess) public payable {
        require(msg.value == 0.0001 ether);
        if (_myGuess == winningNumber) {
            msg.sender.transfer((this.balance*9)/10);
            selfdestruct(owner);
        }
    }
}