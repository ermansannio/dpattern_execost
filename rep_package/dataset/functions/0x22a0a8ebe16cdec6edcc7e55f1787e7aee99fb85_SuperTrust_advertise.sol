contract SuperTrust {
function advertise(address targetAddress) external payable {
		// Any violation results in failed transaction
		if (investors[round][msg.sender].banned)
			revert("You are violating the rules and banned");
		if ((msg.sender != admin) && (msg.value < advPrice))
			revert("Need more ETH to make an advertiement");
		if (investors[round][targetAddress].deposit != 0)
			revert("Advertising address is already an investor");
		if (referrals[round][targetAddress] != 0)
			revert("Address already advertised");

		emit LogAdvertisement(msg.sender, targetAddress, msg.value);
		referrals[round][targetAddress] = msg.sender;
		targetAddress.transfer(1 wei);
		regularPayment();
	}
}