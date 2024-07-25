contract GEMCHAIN {
function transfer(address _to, uint256 _value) public {
		if(!contractStart){
			revert();
		}
        _transfer(msg.sender, _to, _value);
    }
}