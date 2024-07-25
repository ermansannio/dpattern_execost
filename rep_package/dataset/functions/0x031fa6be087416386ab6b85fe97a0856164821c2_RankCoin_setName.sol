contract RankCoin {
function setName(string _name) public {
		
		names[msg.sender] = _name;
		
		emit ChangeName(msg.sender, _name);
	}
}