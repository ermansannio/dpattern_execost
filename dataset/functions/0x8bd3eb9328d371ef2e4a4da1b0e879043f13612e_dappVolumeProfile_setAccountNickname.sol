contract dappVolumeProfile {
function setAccountNickname(string _nickname) public {
		require(msg.sender != address(0));
		require(bytes(_nickname).length > 0);
		ownerAddressToName[msg.sender] = _nickname;
	}
}