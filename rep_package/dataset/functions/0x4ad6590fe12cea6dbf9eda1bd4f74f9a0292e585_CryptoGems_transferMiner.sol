contract CryptoGems {
function transferMiner(address to, uint256 id) public returns (bool success) {
		require(miners[id].owner == msg.sender);
		miners[id].owner = to;
		emit TransferMiner(msg.sender, to, id);
		return true;
	}
}