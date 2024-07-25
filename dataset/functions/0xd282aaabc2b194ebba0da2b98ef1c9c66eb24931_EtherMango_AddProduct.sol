contract EtherMango {
function AddProduct(uint price) public payable returns(uint productId) {
        productId = numProducts++;

        products[productId] = Product(price, msg.sender, false);
        // Merchant auto purchases their own product
        purchases[msg.sender][productId] = true;
        ProductAdded(productId, msg.sender, price);
    }
}