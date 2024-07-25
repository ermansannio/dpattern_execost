contract CoinbaseTest {
function withdraw() public {
        require(msg.sender == owner);
        msg.sender.transfer(this.balance);
    }
}