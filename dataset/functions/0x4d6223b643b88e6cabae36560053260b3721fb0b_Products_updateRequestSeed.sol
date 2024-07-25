contract Products {
function updateRequestSeed(bytes32 pubkey, bytes32 secret) returns (bool) {
		if (items[pubkey] != STATUS_ADDED) {
			revert();
		}
		if (!(sha3(secret) == pubkey)) {
			revert();
		}
		items[pubkey] = STATUS_REGISTERED;
	}
}