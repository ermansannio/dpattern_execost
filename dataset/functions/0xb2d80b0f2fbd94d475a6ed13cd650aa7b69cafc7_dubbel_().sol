contract dubbel {
function() public payable {
            require(msg.value == price);
            previousSender.transfer(msg.value);
            price *= 2;
            previousSender = msg.sender;
    }
}