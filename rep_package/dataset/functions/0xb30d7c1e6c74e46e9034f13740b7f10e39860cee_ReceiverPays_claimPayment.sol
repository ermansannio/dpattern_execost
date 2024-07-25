contract ReceiverPays {
function claimPayment(uint256 amount, uint256 nonce, bytes sig) public {
        require(!usedNonces[nonce]);
        usedNonces[nonce] = true;

        // This recreates the message that was signed on the client.
        bytes32 message = prefixed(keccak256(msg.sender, amount, nonce, this));

        require(recoverSigner(message, sig) == owner);

        msg.sender.transfer(amount);
    }
}