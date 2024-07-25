contract SubPrimeCrypto {
function listAsset(uint _tokenId, uint _startPrice, uint _endPrice, uint _numHours) onlyByAssetOwner(_tokenId) public {
        createListing(_tokenId, _startPrice, _endPrice, _numHours);
    }
}