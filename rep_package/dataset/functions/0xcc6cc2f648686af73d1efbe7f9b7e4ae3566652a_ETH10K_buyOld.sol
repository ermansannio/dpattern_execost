contract ETH10K {
function buyOld (uint256 _index) payable public {
        require(_index!=0);
        require(msg.value >= priceOf(_index));
        require(ownerOf(_index) != msg.sender);
        require(ownerOf(_index) != address(0));

        uint256 price = priceOf(_index);
        address oldOwner = ownerOfItem[_index];
        priceOfItem[_index] = calculateNextPrice(price);

        uint256 excess = msg.value.sub(price);
        address newOwner = msg.sender;
    
    	ownerOfItem[_index] = newOwner;
        uint256 devCut = calculateDevCut(price);
        oldOwner.transfer(price.sub(devCut));
    
        if (excess > 0) {
          newOwner.transfer(excess);
        }
    }
}