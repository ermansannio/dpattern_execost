contract DecentralizedExchangeHotPotato {
function revoke(uint256 _id) public {
    require(msg.sender == orderBook[_id].owner);
    require(orderBook[_id].endTime <= now);
    
    Issuer issuer = Issuer(orderBook[_id].issuer);
    issuer.transfer(msg.sender, orderBook[_id].tokenId);    
    orderBook[_id] = orderBook[orderBookSize-1];
    orderBookSize -= 1;
  }
}