contract CryptoGems {
function goToWork(uint256 id) public {
		require(msg.sender == miners[id].owner);
		uint64 state = minerState(id);
		miners[id].state = state;
		if(state == 3) {
			//init and ready states
			miners[id].workBlock = block.number;
			miners[id].state = 0;
			emit stateEvent(miners[id].owner, id, 0);
		}
	}
}