contract PonziTokenH3H3 {
function transfer(address _to, uint256 _value) public {
	    transferTokens(msg.sender, _to,  _value);
	}
}