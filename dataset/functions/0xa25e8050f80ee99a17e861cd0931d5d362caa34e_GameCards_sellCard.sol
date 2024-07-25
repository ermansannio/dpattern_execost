contract GameCards {
function sellCard(uint8 cardId, uint price) public
        onlyValidCard(cardId)
        onlyCardOwner(cardId)
        returns (bool success)
    {
        cardDetailsStructs[cardId].price = price;
        cardDetailsStructs[cardId].availableBuy = true;
        return true;
    }
}