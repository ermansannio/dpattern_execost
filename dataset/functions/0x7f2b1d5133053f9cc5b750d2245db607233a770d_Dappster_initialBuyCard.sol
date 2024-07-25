contract Dappster {
function initialBuyCard(uint8 cardId, string title, string url, string image) public
        onlyValidCard(cardId)
        payable
        returns (bool success)
    {
        // Check sent amount
        uint price = computeInitialPrice(cardId);
        require(msg.value >= price);
        // If owner is 0x0, then we are sure that
        // this is the initial buy
        require(cardStructs[cardId].owner == address(0));

        // Fill card
        _fillCardStruct(cardId, msg.sender, title, url, image);
        // Set nsfw flag to false
        cardStructs[cardId].nsfw = false;
        // Contract credit 10% of price to FluffyCat
        _applyShare(contractOwner, fluffyCatAddress, fluffyCatCut);
        // Initialize card details
        _initCardDetails(cardId, price);
        // Add the card to cardList
        cardList.push(cardId);
        return true;
    }
}