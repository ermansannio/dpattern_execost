contract Emojisan {
function mint(uint tokenId) external {
        require(msg.sender == minter);
        require(tokenToOwner[tokenId] == 0);
        tokenToOwner[tokenId] = msg.sender;
        totalSupply++;
        tokenByIndex.push(tokenId);
        uint length = tokenOfOwnerByIndex[msg.sender].push(tokenId);
        indexInTokenOfOwnerByIndex[msg.sender][tokenId] = length - 1;
        emit Transfer(0, msg.sender, tokenId);
    }
}