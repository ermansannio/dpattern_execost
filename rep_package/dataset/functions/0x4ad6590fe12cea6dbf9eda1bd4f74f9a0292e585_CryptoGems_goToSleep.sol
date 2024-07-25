contract CryptoGems {
function goToSleep(uint256 id) public {
		require(msg.sender == miners[id].owner);
		uint64 state = minerState(id);
		miners[id].state = state;
		if(state == 1) {
			//tired state
			miners[id].sleepBlock = block.number;
			miners[id].state = 2;
			uint64 curLvl = getMinerLevel(id);
			miners[id].exp = miners[id].exp + miners[id].workDuration;
			uint64 lvl = getMinerLevel(id);

			uint256 gemsMined = (10**decimals)*miners[id].workDuration / miners[id].difficulty;
			balances[ msg.sender ] += gemsMined;
			totalSupply += gemsMined;


			if(curLvl < lvl) {
				miners[id].difficulty = miners[id].difficulty - 2;
			}
			emit stateEvent(miners[id].owner, id, 2);
		}
	}
}