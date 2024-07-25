contract GuessTheNumber {
function withdraw() public {
        require(msg.sender == owner);
        owner.transfer(this.balance);
    }
}