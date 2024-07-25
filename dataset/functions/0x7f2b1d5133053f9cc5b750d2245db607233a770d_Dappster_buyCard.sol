contract Dappster {
function buyCard(uint8 cardId, string title, string url, string image) public
        onlyValidCard(cardId)
        payable
        returns (bool success)
    {
        // Check that this is not an initial buy, i.e. that the
        // card belongs to someone
        require(cardStructs[cardId].owner != address(0));
        // Check if card is on sale
        require(cardDetailsStructs[cardId].availableBuy);
        // Check sent amount
        uint price = cardDetailsStructs[cardId].price;
        require(msg.value >= price);

        address previousOwner = cardStructs[cardId].owner;
        // Take 1% cut on buy
        _applyShare(previousOwner, contractOwner, ownerBuyCut);
        // Fill card
        _fillCardStruct(cardId, msg.sender, title, url, image);
        // Set nsfw flag to false
        cardStructs[cardId].nsfw = false;
        // Disable sell status
        cardDetailsStructs[cardId].availableBuy = false;
        return true;
    }
}