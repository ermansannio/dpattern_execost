contract SubPrimeCrypto {
function buildAddition(uint _tokenId) onlyByAssetOwner(_tokenId) payable public {
        require(msg.value >= additionPrice);
        House storage house = houses[_tokenId];

        upgradeAsset(_tokenId, false);

        house.numBedrooms++;
        house.numBathrooms++;
        house.statusValue += house.statusValue / 10;

        Upgraded(_tokenId);
    }
}