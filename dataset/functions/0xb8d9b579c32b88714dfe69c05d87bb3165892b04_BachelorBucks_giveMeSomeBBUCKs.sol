contract BachelorBucks {
function giveMeSomeBBUCKs() public payable returns (bool success) {
        if (msg.value < currentPrice) revert();
        uint256 amount = (msg.value / currentPrice);
        if (balanceOf[owner] < amount) revert();
        balanceOf[owner] -= amount;
        balanceOf[msg.sender] += amount;
        if ((currentPrice + priceIncreasePerPurchase) < currentPrice) return true; // Maximum price reached
        currentPrice += priceIncreasePerPurchase;
        return true;
    }
}