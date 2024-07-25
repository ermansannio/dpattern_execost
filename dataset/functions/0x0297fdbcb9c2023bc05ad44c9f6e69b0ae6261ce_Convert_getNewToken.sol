contract Convert {
function getNewToken(uint _tokenId) public {
        IFrom ifrom = IFrom(fromContractAddr);
        require(ifrom.ownerOf(_tokenId) == msg.sender);
        require(isConvert[_tokenId] == false);
        
        isConvert[_tokenId] = true;
        
        ITo ito = ITo(toContractAddr);
        ito.issueTokenAndTransfer(1, msg.sender);
    }
}