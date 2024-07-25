contract PercentToken {
function transfer(address to, uint amount) external returns (bool) {
        require(to != address(this));
        require(to != 0);
        uint balanceOfMsgSender = balanceOf[msg.sender];
        require(balanceOfMsgSender >= amount);
        balanceOf[msg.sender] = balanceOfMsgSender - amount;
        balanceOf[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }
}