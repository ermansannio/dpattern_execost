contract ISmartCert {
function revokeCert(bytes32 certHash, bytes sigCertHash, bytes32 merkleHash, bool batchFlag, uint revocationDate) public {
		string memory status;
		string memory message;

		(status, message) = internalRevokeCert(certHash, sigCertHash, merkleHash, batchFlag, revocationDate);
		LogRevokeCert(status, message);
	}
}