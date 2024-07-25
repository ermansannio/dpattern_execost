contract Ethertag {
function addMessage(string m, uint8 r, uint8 g, uint8 b) public payable {
        require(msg.value >= minValue);
        require(bytes(m).length <= maxTextLength);
        messages.push(message(m, msg.value, rgb(r,g,b)));
        emit newMessage(
            messages.length-1,
            messages[messages.length-1].text, 
            messages[messages.length-1].value, 
            messages[messages.length-1].color.red,
            messages[messages.length-1].color.green,
            messages[messages.length-1].color.blue
            );
    }
}