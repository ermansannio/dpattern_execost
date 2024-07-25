contract SubPrimeCrypto {
function removeAssetListing(uint _tokenId) public onlyByAssetOwner(_tokenId) {
        listings[_tokenId].isAvailable = false;
    }
}