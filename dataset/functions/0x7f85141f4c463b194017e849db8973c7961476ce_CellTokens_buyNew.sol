contract CellTokens {
function buyNew (uint256 _xpos,uint256 _ypos,uint256 _size) payable public {
        require(checkIsOnSale(_ypos) == true);
        require(_size == 1);
        require(_xpos + _size <= MAX_COLS);
        uint256 _itemId = generateId(_xpos,_ypos,_size);
        require(priceOf(_itemId)==0);
        uint256 price =startingPrice;
        address oldOwner = owner;

        listedItems.push(_itemId);
        priceOfItem[_itemId] = calculateNextPrice(price);
        uint256 excess = msg.value.sub(price);
        address newOwner = msg.sender;
    
    	ownerOfItem[_itemId] = newOwner;
        uint256 devCut = calculateDevCut(price);
        oldOwner.transfer(price.sub(devCut));
    
        if (excess > 0) {
          newOwner.transfer(excess);
        }
    }
}