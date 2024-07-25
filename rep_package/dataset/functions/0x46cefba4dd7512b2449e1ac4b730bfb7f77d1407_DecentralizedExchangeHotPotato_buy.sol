contract DecentralizedExchangeHotPotato {
function buy(uint256 _id) public payable{
    require(msg.value >= orderBook[_id].price);
    require(msg.sender != orderBook[_id].owner);
    require(!isContract(msg.sender));
    require(orderBook[_id].startTime <= now && now <= orderBook[_id].endTime);
    orderBook[_id].owner.transfer(orderBook[_id].price*24/25); // 96%
    orderBook[_id].creator.transfer(orderBook[_id].price/50);  // 2%    
    if (msg.value > orderBook[_id].price) {
        msg.sender.transfer(msg.value - orderBook[_id].price);
    }
    orderBook[_id].owner = msg.sender;
    orderBook[_id].price = getNextPrice(orderBook[_id].price);
  }
}