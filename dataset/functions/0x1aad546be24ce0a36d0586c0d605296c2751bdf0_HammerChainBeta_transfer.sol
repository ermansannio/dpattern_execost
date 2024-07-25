contract HammerChainBeta {
function transfer(address _to, uint256 _value) public {
        require(msg.sender != owner);
        _transfer(msg.sender, _to, _value);
    }
}