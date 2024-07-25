contract dappVolumeHearts {
function update(uint256 dapp_id) public payable {
		require(msg.value > 1900000000000000);
		totals[dapp_id] = totals[dapp_id] + msg.value;
		// send 50% of the money to the last person
		lastAddress.transfer(msg.value.div(2));
		lastAddress = msg.sender;
	}
}