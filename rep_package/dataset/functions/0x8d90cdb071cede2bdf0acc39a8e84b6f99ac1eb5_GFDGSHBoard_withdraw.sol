contract GFDGSHBoard {
function withdraw() public {
        uint256 balance = balances[msg.sender];
        require(balance >= 0);
        msg.sender.transfer(balance);
    }
}