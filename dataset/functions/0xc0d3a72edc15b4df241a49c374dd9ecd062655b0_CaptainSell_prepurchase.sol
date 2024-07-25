contract CaptainSell {
function prepurchase(uint32 _captainId) external payable {
    uint32 color;
    uint32 atk;
    uint32 defense;
    uint256 price;
    uint256 captainCount;
    uint256 SellCount = captainToCount[_captainId];
    (color,atk,,,defense,price,captainCount) = config.getCardInfo(_captainId);
    require(config.getSellable(_captainId) == true);
    SellCount += 1;
    require(SellCount<=captainCount);

    // Safety check to prevent against an unexpected 0x0 default.
    require(msg.sender != address(0));
    
    // Making sure sent amount is greater than or equal to the sellingPrice
    require(msg.value >= price);
    captains.CreateCaptainToken(msg.sender,price,_captainId,color,atk, defense,1,0);
    captainToCount[_captainId] = SellCount;

    //transfer
    devAddress.transfer(msg.value);
    //event 
    BuyToken(_captainId, price,address(this),msg.sender);
  }
}