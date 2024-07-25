contract U42 {
function updateServiceTokensPerCredit (
			address _targetApplicationAddress, 
			uint32 _serviceId, 
			uint256 _tokensPerCredit ) 
		public returns (
			bool success ) {

		//get the referenced service
		Service storage s=services[_targetApplicationAddress][_serviceId];

		//check that service exists
		require(s.applicationAddress != 0);

		//update must be by the application address or, if specified, update address
		require(msg.sender == _targetApplicationAddress || 
			( s.updateAddress != address(0) && msg.sender == s.updateAddress ));

		//check that service is not removed
		require(s.isRemoved == false);

		//check changed cost of the service is >0 
		require(_tokensPerCredit != 0);

		services[_targetApplicationAddress][_serviceId].tokensPerCredit=_tokensPerCredit;
		
		emit ServiceChanged(_targetApplicationAddress, _serviceId);

		return true;		
	}
}