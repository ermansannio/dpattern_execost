contract ETH10K {
function addBlock(address _to, uint256 _xpos,uint256 _ypos,uint256 _size,uint256 _price) onlyAdmins() public {
        require(checkIsOnSale(_ypos) == true);
        require(_size == 1);
        require(_xpos + _size <= MAX_COLS);
        uint256 _itemId = generateId(_xpos,_ypos,_size);
        require(priceOf(_itemId)==0);
        require(ownerOf(_itemId)==address(0));
        
        listedItems.push(_itemId);
        priceOfItem[_itemId] = _price;
    	ownerOfItem[_itemId] = _to;
    }
}