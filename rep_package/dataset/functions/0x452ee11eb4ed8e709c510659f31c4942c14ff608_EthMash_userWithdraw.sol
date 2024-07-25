contract EthMash {
function userWithdraw() public {
        require(balances[msg.sender] > 0);
        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;
        msg.sender.transfer(amount);
    }
}