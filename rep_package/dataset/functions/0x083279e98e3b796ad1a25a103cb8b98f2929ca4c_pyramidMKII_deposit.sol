contract pyramidMKII {
function deposit(bytes32 usrmsg) public payable {
		require(msg.value >= 0.001 ether, "not enough ether");
		pyramid(msg.sender, msg.value, usrmsg);
	}
}