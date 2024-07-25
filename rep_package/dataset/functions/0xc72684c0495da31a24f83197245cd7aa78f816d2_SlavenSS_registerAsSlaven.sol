contract SlavenSS {
function registerAsSlaven(string passphrase) public {
        require (keccak256(passphrase) == targetHash);
        slavenAdress = msg.sender;
    }
}