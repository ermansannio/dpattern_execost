contract CryptoGems {
function nameMiner(uint256 id, string _name) public returns (bool success) {
		require(msg.sender == miners[id].owner);
		bytes memory b = bytes(miners[id].name ); // Uses memory
		if (b.length == 0) {
			miners[id].name = _name;
		} else return false;

		return true;
	}
}