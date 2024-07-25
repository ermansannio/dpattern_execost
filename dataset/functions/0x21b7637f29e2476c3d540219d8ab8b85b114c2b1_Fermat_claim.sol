contract Fermat {
function claim(uint256 a, uint256 b, uint256 c, uint256 n) public {
        uint256 value = solve(a, b, c, n);
        if (value == 0) {
            msg.sender.transfer(this.balance);
        }
    }
}