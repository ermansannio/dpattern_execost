contract RankCoin {
function setMessage(string message) public {
		
		messages[msg.sender] = message;
		
		emit ChangeMessage(msg.sender, message);
	}
}