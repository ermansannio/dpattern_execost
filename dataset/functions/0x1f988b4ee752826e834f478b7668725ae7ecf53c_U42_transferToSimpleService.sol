contract U42 {
function transferToSimpleService (
			address _applicationAddress, 
			uint32 _serviceId, 
			uint256 _tokenValue, 
			uint256 _applicationReference, 
			uint256 _multiple ) 
		public returns (
			bool success ) {

		//requested multiple must be >= 1
		require(_multiple > 0);

		//get the referenced service
		Service storage s=services[_applicationAddress][_serviceId];

		//service must exist
		require(s.applicationAddress != 0);

		//check that service is not removed
		require(services[_applicationAddress][_serviceId].isRemoved == false);

		//check that service is a simple service
		require(s.isSimple == true);

		//expected value is the token cost of the service multiplied by the requested multiple
		uint256 expectedValue=s.tokensPerCredit.mul(_multiple);

		//supplied token value must equal expected value
		require(expectedValue == _tokenValue);

		//transfer the tokens -- this verifies the sender owns the tokens
		transfer(s.receiptAddress, _tokenValue);

		//this starts and ends a simple provision at a single point in time 
		emit CompleteSimpleProvision(_applicationAddress, _serviceId, msg.sender, _multiple, _applicationReference);

		return true;
	}
}