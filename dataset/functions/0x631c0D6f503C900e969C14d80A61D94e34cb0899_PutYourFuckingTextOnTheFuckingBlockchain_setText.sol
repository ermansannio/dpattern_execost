contract PutYourFuckingTextOnTheFuckingBlockchain {
function setText(string newText) public payable returns (bool) {
        if (msg.value > mostSent && bytes(newText).length < maxLength) {
            currentText = newText;
            mostSent = msg.value;
            return true;
        } else {
            msg.sender.transfer(msg.value);
            return false;
        }
    }
}