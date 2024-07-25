contract TokenCity {
function adminWithdraw(uint256 _amount) public {
		uint256 perFounder = _amount / 3;
		address(0xD5d6301dE62D82F461dC29824FC597D38d80c424).transfer(perFounder); // eric
		address(0x1E4F1275bB041586D7Bec44D2E3e4F30e0dA7Ba4).transfer(perFounder); // simon
		address(0xe1811eC49f493afb1F4B42E3Ef4a3B9d62d9A01b).transfer(perFounder); // david
	}
}