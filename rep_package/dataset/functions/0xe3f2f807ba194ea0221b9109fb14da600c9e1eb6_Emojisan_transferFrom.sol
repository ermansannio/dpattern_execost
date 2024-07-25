contract Emojisan {
function transferFrom(address from, address to, uint tokenId) public {
        require(to != address(this));
        require(to != 0);
        address owner = tokenToOwner[tokenId];
        address approved = getApproved[tokenId];
        require(from == owner);
        require(msg.sender == owner || msg.sender == approved || isApprovedForAll[owner][msg.sender]);
        tokenToOwner[tokenId] = to;
        uint index = indexInTokenOfOwnerByIndex[from][tokenId];
        uint lastIndex = tokenOfOwnerByIndex[from].length - 1;
        if (index != lastIndex) {
            uint lastTokenId = tokenOfOwnerByIndex[from][lastIndex];
            tokenOfOwnerByIndex[from][index] = lastTokenId;
            indexInTokenOfOwnerByIndex[from][lastTokenId] = index;
        }
        tokenOfOwnerByIndex[from].length--;
        uint length = tokenOfOwnerByIndex[to].push(tokenId);
        indexInTokenOfOwnerByIndex[to][tokenId] = length - 1;
        if (approved != 0) {
            delete getApproved[tokenId];
        }
        emit Transfer(from, to, tokenId);
    }
}