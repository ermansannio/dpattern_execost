contract KingOfTheHill {
function () external payable {
		require(msg.value == 0.1 ether);
		if ((lastKing + timeLimit) < block.timestamp) {
			winner();
		}
		previousEntries.push(currentKing);
		lastKing = block.timestamp;
		currentKing = msg.sender;
		NewKing(currentKing, lastKing);
	}
}