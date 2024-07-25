contract dappVolumeProfile {
function setAccountUrl(string _url) public {
		require(msg.sender != address(0));
		require(bytes(_url).length > 0);
		ownerAddressToUrl[msg.sender] = _url;
	}
}