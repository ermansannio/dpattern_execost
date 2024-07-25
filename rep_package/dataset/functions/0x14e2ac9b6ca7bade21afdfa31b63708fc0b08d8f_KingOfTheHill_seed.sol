contract KingOfTheHill {
function seed() external payable {
		require(msg.sender == owner);
		lastKing = block.timestamp;
	}
}