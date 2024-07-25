contract ETHMap {
function withdraw() public
        returns (bool success) 
    {
        uint amount = pendingWithdrawals[msg.sender];
        pendingWithdrawals[msg.sender] = 0;
        msg.sender.transfer(amount);
        return true;
    }
}