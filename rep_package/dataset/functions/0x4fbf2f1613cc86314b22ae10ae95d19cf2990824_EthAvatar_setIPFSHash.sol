contract EthAvatar {
function setIPFSHash(string hash) public {
        ipfsHashes[msg.sender] = hash;

        DidSetIPFSHash(msg.sender, hash);
    }
}