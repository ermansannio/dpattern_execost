contract SelfKeyCrowdsale {
function () public payable {
        buyTokens(msg.sender);
    }
}