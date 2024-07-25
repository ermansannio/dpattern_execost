contract CryptoSuperGirlfriend {
function changeOwnerInfo (uint256 _itemId, uint256 _sellPrice, string _ownerName, string _ownerWords, string _ownerImg, string _ownerNation) public returns (bool _result) {    
    require(_checkItemId(_itemId));
    require(ownerOf(_itemId) == msg.sender);
    require(_sellPrice.sub(priceInit) >= 0);
    require(priceOfItem[_itemId].mul(2).sub(_sellPrice) >= 0); 
    
    sellPriceOfItem[_itemId] = _sellPrice;    
    OwnerInfo memory oi = OwnerInfo(_ownerName, _ownerWords, _ownerImg, _ownerNation);  
    ownerInfoOfItem[_itemId] = oi;       

    return true;    
  }
}