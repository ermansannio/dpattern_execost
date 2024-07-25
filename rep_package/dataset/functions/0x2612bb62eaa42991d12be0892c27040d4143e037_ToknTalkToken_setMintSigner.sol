contract ToknTalkToken {
function setMintSigner(address newMintSigner) external {
        require(msg.sender == mintSigner);
        mintSigner = newMintSigner;
    }
}