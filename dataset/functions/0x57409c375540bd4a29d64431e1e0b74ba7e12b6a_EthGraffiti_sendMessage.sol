contract EthGraffiti {
function sendMessage(string message) public payable {
        require (msg.value == MESSAGE_PRICE);
        messages[messageNumber] = message;
        messageNumber++;
    }
}