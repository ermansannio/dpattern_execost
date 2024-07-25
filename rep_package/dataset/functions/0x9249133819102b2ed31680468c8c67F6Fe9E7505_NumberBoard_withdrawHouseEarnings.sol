contract NumberBoard {
function withdrawHouseEarnings() {
		require(msg.sender == houseOwner);

		uint amount = houseEarnings;
		houseEarnings = 0;
        msg.sender.transfer(amount);
	}
}