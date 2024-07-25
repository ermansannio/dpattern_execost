contract ToknTalkToken {
function mintUsingSignature(uint max, uint8 v, bytes32 r, bytes32 s) external {
        bytes memory maxString = toString(max);
        bytes memory messageLengthString = toString(124 + maxString.length);
        bytes32 hash = keccak256(abi.encodePacked(
            "x19Ethereum Signed Message:n",
            messageLengthString,
            "I approve address 0x",
            toHexString(msg.sender),
            " to mint token 0x",
            toHexString(this),
            " up to ",
            maxString
        ));
        require(ecrecover(hash, v, r, s) == mintSigner);
        uint mintedByMsgSender = mintedBy[msg.sender];
        require(max > mintedByMsgSender);
        mintedBy[msg.sender] = max;
        balanceOf[msg.sender] += max - mintedByMsgSender;
        emit Transfer(0, msg.sender, max - mintedByMsgSender);
    }
}