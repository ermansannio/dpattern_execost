contract EthereumUltimate {
function approve(address _spender, uint256 _value) public returns (bool success) {
        // Buried addresses cannot be approved
        require(!buried[msg.sender]);
        
        allowance[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
}