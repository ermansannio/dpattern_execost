contract NFTHouseGame {
function generatePresaleHouse() onlyByOwnerOrDev onlyDuringPresale public {
        uint houseId = generateHouse(this);
        uint sellPrice = (houses[houseId].propertyValue / 5000) * 1 finney;

        if (sellPrice > 250 finney) sellPrice = 250 finney;
        if (sellPrice < 50 finney) sellPrice = 50 finney;

        createListing(houseId, sellPrice, 0, 30);
    }
}