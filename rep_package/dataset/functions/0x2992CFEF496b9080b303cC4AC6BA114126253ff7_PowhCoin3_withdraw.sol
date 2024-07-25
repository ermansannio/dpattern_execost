contract PowhCoin3 {
function withdraw(uint tokenCount) public returns (bool) {
        var balance = dividends(msg.sender);
        payouts[msg.sender] += (int256) (balance * PRECISION);
        totalPayouts += (int256) (balance * PRECISION);
        msg.sender.transfer(balance);
        return true;
    }
}