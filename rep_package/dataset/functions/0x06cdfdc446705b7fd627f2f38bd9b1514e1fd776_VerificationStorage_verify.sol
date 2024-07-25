contract VerificationStorage {
function verify(bytes _ipfsHash) public {
        emit Verification(_ipfsHash);
    }
}