contract NFTHouseGame {
function buildAddition(uint _tokenId) onlyByAssetOwner(_tokenId) payable public {
        House storage house = houses[_tokenId];
        require(msg.value >= additionPrice);

        if (presaleOngoing) presaleProceeds += msg.value;

        house.numBedrooms += (msg.value / additionPrice);
        processUpgrades(house);
    }
}