contract CryptoSuperGirlfriend {
function buy (uint256 _itemId, uint256 _sellPrice, string _name, string _ownerName, string _ownerWords, string _ownerImg, string _ownerNation) payable public returns (bool _result) {
    require(_checkItemId(_itemId));
    require(ownerOf(_itemId) != msg.sender);
    require(msg.sender != address(0)); 
    require(_sellPrice == 0 || _sellPrice.sub(priceInit) >= 0);
    require(msg.value.sub(sellPriceOf(_itemId)) >= 0);
    require(msg.value.mul(2).sub(_sellPrice) >= 0);   
   
    if(_sellPrice == 0)
       _sellPrice = calculateNextPrice(msg.value);  
    
    if(tokenExists(_itemId) == false)
       newItem(_itemId, _name, priceInit);

    address oldOwner = ownerOf(_itemId);
    address newOwner = msg.sender;      
    
    if(oldOwner != address(0))    
    {
      if(msg.value > priceOf(_itemId))
      {
         uint256 tradeCut;
         tradeCut = msg.value.sub(priceOf(_itemId));
         tradeCut = tradeCut.mul(10).div(100); 
         oldOwner.transfer(msg.value.sub(tradeCut)); 
      }
      else
         oldOwner.transfer(msg.value); 
    }    
      
    priceOfItem[_itemId] = msg.value;    
    sellPriceOfItem[_itemId] = _sellPrice;
    OwnerInfo memory oi = OwnerInfo(_ownerName, _ownerWords, _ownerImg, _ownerNation);  
    ownerInfoOfItem[_itemId] = oi;    
    
    _transfer(oldOwner, newOwner, _itemId); 
    emit Bought(_itemId, newOwner, msg.value);
    emit Sold(_itemId, oldOwner, msg.value);   
    owner().transfer(address(this).balance);  

    return true;
    
  }
}