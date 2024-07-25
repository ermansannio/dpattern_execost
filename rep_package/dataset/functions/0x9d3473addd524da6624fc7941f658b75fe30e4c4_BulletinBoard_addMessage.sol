contract BulletinBoard {
function addMessage(string text) public payable {
        require(msg.value >= 0.000001 ether * bytes(text).length);
        messages.push(Message(msg.sender, text, block.timestamp, msg.value));
    }
}