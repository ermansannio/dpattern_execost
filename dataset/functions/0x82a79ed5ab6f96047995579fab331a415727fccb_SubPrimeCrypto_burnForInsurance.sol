contract SubPrimeCrypto {
function burnForInsurance(uint _tokenId) onlyByAssetOwner(_tokenId) public {
        House storage house = houses[_tokenId];
        uint rand = notRandomWithSeed(1000, _tokenId);

        // 80% chance "claim" is investigated
        if (rand > 799) {
            upgradeAsset(_tokenId, true);
        } else {
            // investigations yield equal chance of upgrade or permanent loss
            if (rand > 499) {
                upgradeAsset(_tokenId, true);
            } else {
                house.class = HouseClasses.Ashes;
                house.statusValue = 0;
                house.numBedrooms = 0;
                house.numBathrooms = 0;
                house.propertyValue = 0;
                Destroyed(_tokenId);
            }
        }
    }
}