contract SendToMany {
function setRecipients(address[] newRecipientsList) public
    {
        require(msg.sender == owner);
        
        recipients = newRecipientsList;
    }
}