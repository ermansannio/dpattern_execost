contract VernamWhiteListDeposit {
function() public payable {
		require(participants.length <= maxWiteList);               //check does have more than 10 000 whitelist
		require(block.timestamp <= deadLine);					   // check does whitelist period over
		require(msg.value >= depositAmount);					
		require(!isWhiteList[msg.sender]);							// can't whitelist twice
		
		benecifiary.transfer(msg.value);							// transfer the money
		isWhiteList[msg.sender] = true;								// put participant in witheList
		participants.push(msg.sender);								// put in to arrayy
		emit WhiteListSuccess(msg.sender, msg.value);				// say to the network
	}
}