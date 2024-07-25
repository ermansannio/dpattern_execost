contract ETD {
function transfer(address _to, uint256 _value) notICO {
        require(!frozen[msg.sender]);                       //prevent transfer from frozen address
        if (msg.sender.balance  < minBalanceForAccounts) {
            sell((minBalanceForAccounts - msg.sender.balance) * sellPrice);
        }
        _transfer(msg.sender, _to, _value);
    }
}