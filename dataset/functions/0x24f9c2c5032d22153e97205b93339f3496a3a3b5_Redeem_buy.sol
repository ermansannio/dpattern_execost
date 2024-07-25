contract Redeem {
function buy(uint _idx, string _slogan) enabled payable public {
    Item storage item = items[_idx];
    if (item.price == 0) {
      item.price = startPrice[_idx % startPrice.length];
      item.nextPrice = nextPriceOf(item.price);
      itemIndices.push(_idx);
    }
    require(item.price > 0);
    uint curWei = item.price * 1e15;
    require(curWei <= msg.value);
    address oldOwner = item.owner;
    uint oldPrice = item.price;
    if (item.owner != 0x0) {
      require(item.owner != msg.sender);
      item.owner.transfer(curWei * (1000 - cutOf(item.price)) / 1000);
    }
    msg.sender.transfer(msg.value - curWei);
    item.owner = msg.sender;
    item.slogan = _slogan;
    item.price = item.nextPrice;
    item.nextPrice = nextPriceOf(item.price);
    OnSold(_idx, oldOwner, item.owner, oldPrice, item.price, item.slogan);
  }
}