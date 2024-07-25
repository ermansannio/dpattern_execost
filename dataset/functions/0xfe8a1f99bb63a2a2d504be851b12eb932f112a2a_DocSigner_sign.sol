contract DocSigner {
function sign( string signingHash,
                   string message )
        external
        onlySigner
    {
        require(keccak256(signingHash) == keccak256(docHash));

        // save the message to state so that it can be easily queried
        messages[msg.sender] = message;

        Signature(msg.sender, docHash, message);
    }
}