contract SuperTrust {
function setAdvPrice(uint256 newValue) public asAdmin {
		emit LogAdvPriceChanged(msg.sender, advPrice, newValue);
		advPrice = newValue;
	}
}