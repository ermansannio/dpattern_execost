contract FTBTokenERC20 {
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        _transfer(_from, _to, _value);
        return true;
    }
}