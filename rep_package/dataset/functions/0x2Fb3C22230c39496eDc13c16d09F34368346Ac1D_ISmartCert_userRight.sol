contract ISmartCert {
function userRight(address userAddr, bytes1 accessRight, uint date) public {
		if (owner != msg.sender) {
			LogUserRight(STATUS_FAIL, CODE_ACCESS_DENIED);
			return;
		}
		if (accessRight != ACCESS_ISSUER && accessRight != ACCESS_POSTER && accessRight != ACCESS_VERIFIER && accessRight != ACCESS_ALL && accessRight != ACCESS_ISSUER_POSTER && accessRight != ACCESS_NONE) {
			LogUserRight(STATUS_FAIL, MSG_INVALID_ACCESS_RIGHT);
			return;
		}
		accessList[userAddr].accessRight = accessRight;
		accessList[userAddr].date = date;
		accessList[userAddr].isValue = true;
		LogUserRight(STATUS_PASS, "");
	}
}