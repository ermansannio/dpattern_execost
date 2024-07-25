contract Dappster {
function editCard(uint8 cardId, string title, string url, string image) public
        onlyValidCard(cardId)
        onlyCardOwner(cardId)
        returns (bool success)
    {
        // Fill card
        _fillCardStruct(cardId, msg.sender, title, url, image);
        // Disable sell status
        return true;
    }
}