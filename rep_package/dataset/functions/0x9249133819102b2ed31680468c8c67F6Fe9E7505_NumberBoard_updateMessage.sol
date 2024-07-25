contract NumberBoard {
function updateMessage(uint theNum, string aMessage) {
		require(isOwner(msg.sender, theNum));

		ownership[theNum].theMessage = aMessage;
	}
}