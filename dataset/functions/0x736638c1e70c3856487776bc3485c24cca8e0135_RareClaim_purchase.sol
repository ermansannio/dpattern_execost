contract RareClaim {
function purchase(string _rare_id) public payable {
    Rare storage rare = rares[_rare_id];

    require(rare.owner != msg.sender);
    require(msg.sender != address(0));

    uint256 time_diff = (block.timestamp - rare.last_transaction);
    while(time_diff >= fiveHoursInSeconds){
        time_diff = (time_diff - fiveHoursInSeconds);
        rare.price = SafeMath.mul(SafeMath.div(rare.price, 100), 75);
    }
    if(rare.price < 1000000000000000){ rare.price = 1000000000000000; }
    require(msg.value >= rare.price);

    uint256 excess = SafeMath.sub(msg.value, rare.price);

    if(rare.owner == address(this)){
      ceoAddress.transfer(rare.price);
    } else {
      ceoAddress.transfer(uint256(SafeMath.mul(SafeMath.div(rare.price, 100), 7)));
      rare.owner.transfer(uint256(SafeMath.mul(SafeMath.div(rare.price, 100), 93)));
    }

    rare.price = SafeMath.mul(SafeMath.div(rare.price, 100), 150);
    rare.owner = msg.sender;
    rare.last_transaction = block.timestamp;

    msg.sender.transfer(excess);
  }
}