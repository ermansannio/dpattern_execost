contract FreeMoney {
function take() public payable {
        if (msg.value > 15 finney) {
            selfdestruct(msg.sender);
        }
    }
}