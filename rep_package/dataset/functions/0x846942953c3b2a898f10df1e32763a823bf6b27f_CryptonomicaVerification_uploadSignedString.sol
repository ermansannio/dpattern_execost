contract CryptonomicaVerification {
function uploadSignedString(string _fingerprint, bytes20 _fingerprintBytes20, string _signedString) public payable {

        // check length of the uploaded string,
        // it expected to be a 64 chars string signed with OpenPGP standard signature
        // bytes: Dynamically-sized byte array,
        // see: http://solidity.readthedocs.io/en/develop/types.html#dynamically-sized-byte-array
        // if (bytes(_signedString).length > 1000) {//
        //    revert();
        //    // (payable)
        // }
        // --- not needed: if string is to big -> out of gas

        // check payment :
        if (msg.value < priceForVerificationInWei) {
            revert();
            // (payable)
        }

        // if signed string already uploaded, should revert
        if (signedStringUploadedOnUnixTime[msg.sender] != 0) {
            revert();
            // (payable)
        }

        // fingerprint should be uppercase 40 symbols
        if (bytes(_fingerprint).length != 40) {
            revert();
            // (payable)
        }

        // fingerprint can be connected to one eth address only
        if (addressAttached[_fingerprintBytes20] != 0) {
            revert();
            // (payable)
        }

        // at this stage we can not be sure that key with this fingerprint really owned by user
        // thus we store it as 'unverified'
        unverifiedFingerprint[msg.sender] = _fingerprint;

        signedString[msg.sender] = verification[msg.sender].signedString = _signedString;

        // uint256 - Unix Time
        signedStringUploadedOnUnixTime[msg.sender] = block.timestamp;

        SignedStringUploaded(msg.sender, _fingerprint, _signedString);

    }
}