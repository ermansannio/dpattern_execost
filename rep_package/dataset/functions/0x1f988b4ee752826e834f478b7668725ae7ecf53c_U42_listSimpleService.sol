contract U42 {
function listSimpleService ( 
			uint32 _serviceId, 
			string _serviceDescription,
			uint256 _tokensRequired,
			address _updateAddress,
			address _receiptAddress	) 
		public returns (
			bool success ) {

		//check service id is not 0
		require(_serviceId != 0);

		//check service doesn't already exist for this application id
		require(services[msg.sender][_serviceId].applicationAddress == 0);

		//check cost of the service is >0 
		require(_tokensRequired != 0);

		//check receiptAddress is not address(0)
		require(_receiptAddress != address(0));

		//update address should be address(0) or a non-sender address
		require(_updateAddress != msg.sender);

		//add service to services mapping
		services[msg.sender][_serviceId] = Service(
				msg.sender,
				_serviceId,
				true,
				_serviceDescription,
				_tokensRequired,
				1,
				_updateAddress,
				_receiptAddress,
				false,
				0
			);

		//add service to servicesLists for application
		servicesLists[msg.sender].push(_serviceId);

		//emit NewService
		emit NewService(msg.sender, _serviceId);

		return true;
	}
}