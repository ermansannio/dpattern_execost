contract IPFSStore {
function setHash(uint256 time_stamp, string ipfs_hash) public {
        require(msg.sender == owner);
        hashes[time_stamp] = ipfs_hash;
    }
}