contract U42 {
function ownerBurn ( 
			uint256 _value )
		public returns (
			bool success) {

		//only the contract owner can burn tokens
		require(msg.sender == contractOwner);

		//can only burn tokens held by the owner
		require(_value <= balances[contractOwner]);

		//total supply of tokens is decremented when burned
		totalSupply_ = totalSupply_.sub(_value);

		//balance of the contract owner is reduced (the contract owner's tokens are burned)
		balances[contractOwner] = balances[contractOwner].sub(_value);

		//burning tokens emits a transfer to 0, as well as TokensBurned
		emit Transfer(contractOwner, address(0), _value);
		emit TokensBurned(contractOwner, _value);

		return true;

	}
}