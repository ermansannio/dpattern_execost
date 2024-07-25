contract TrumpBingo {
function withdraw(address who) public {
        require(profits[who] > 0);
        uint256 amount = profits[who];
        profits[who] = 0;
        who.transfer(amount);
    }
}