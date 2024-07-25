contract EtherMango {
function Pay(uint productId) public payable {
        require(products[productId].price == msg.value);
        require(products[productId].isFrozen == false);

        uint fee = msg.value / feePercent;
        uint remaining = msg.value - fee;
        // Immediately pay out merchant, but keep fees in contract
        // Which keeps the gas cost lower
        products[productId].merchant.transfer(remaining);
        
        // Log the purchase on the blockchain
        purchases[msg.sender][productId] = true;
        ProductPurchased(productId, msg.sender);
    }
}