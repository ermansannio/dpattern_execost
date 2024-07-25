contract SendToMany {
function sendToAll(uint256 amountPerRecipient) payable public
    {
        for (uint256 i=0; i<recipients.length; i++)
        {
            recipients[i].transfer(amountPerRecipient);
        }
    }
}