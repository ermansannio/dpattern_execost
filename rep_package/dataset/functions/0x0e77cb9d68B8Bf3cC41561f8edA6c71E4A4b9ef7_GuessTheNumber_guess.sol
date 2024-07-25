contract GuessTheNumber {
function guess(uint8 number) public payable {
        // guessed number is correct, cost of attempt is paid and
        // each next attempt should be more expensive than previous
        if (keccak256(number) == secretNumberHash && msg.value >= 1 ether && msg.value >= this.balance) {
            // send the jack pot
            msg.sender.transfer(this.balance + msg.value);
        }
    }
}