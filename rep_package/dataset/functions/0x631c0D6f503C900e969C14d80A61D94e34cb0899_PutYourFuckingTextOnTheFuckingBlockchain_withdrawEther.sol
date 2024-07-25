contract PutYourFuckingTextOnTheFuckingBlockchain {
function withdrawEther() external {
        require(msg.sender == owner);
        owner.transfer(this.balance);
    }
}