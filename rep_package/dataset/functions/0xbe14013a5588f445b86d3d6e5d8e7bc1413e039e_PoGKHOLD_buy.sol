contract PoGKHOLD {
function buy(address _referredBy) public payable returns (uint) {
        purchaseTokens(msg.value, _referredBy);
    }
}