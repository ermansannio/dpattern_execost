contract Products {
function addItem(bytes32 pubkey) public returns (bool) {
		if (msg.sender != owner) {
			revert();
		}
		items[pubkey] = STATUS_ADDED;
	}
}