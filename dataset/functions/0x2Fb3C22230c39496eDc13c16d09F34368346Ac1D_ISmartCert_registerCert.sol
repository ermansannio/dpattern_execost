contract ISmartCert {
function registerCert(bytes32 certHash, bytes sig, uint registrationDate) public {		
		string memory status;
		string memory message;

		(status, message) = internalRegisterCert(certHash, sig, registrationDate);		
		LogRegisterCert(status, message);
	}
}