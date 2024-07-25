contract NFTHouseGame {
function listAsset(uint _tokenId, uint _startPrice, uint _endPrice, uint _numDays) onlyByAssetOwner(_tokenId) public {
        createListing(_tokenId, _startPrice, _endPrice, _numDays);
    }
}