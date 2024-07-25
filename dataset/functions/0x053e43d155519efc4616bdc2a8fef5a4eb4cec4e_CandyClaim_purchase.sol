contract CandyClaim {
function purchase(string _candy_id) public payable {
    Candy storage candy = candies[_candy_id];

    require(candy.owner != msg.sender);
    require(msg.sender != address(0));

    uint256 time_diff = (block.timestamp - candy.last_transaction);
    while(time_diff >= fiveHoursInSeconds){
        time_diff = (time_diff - fiveHoursInSeconds);
        candy.price = SafeMath.mul(SafeMath.div(candy.price, 100), 90);
    }
    if(candy.price < 1000000000000000){ candy.price = 1000000000000000; }
    require(msg.value >= candy.price);

    uint256 excess = SafeMath.sub(msg.value, candy.price);

    if(candy.owner == address(this)){
      ceoAddress.transfer(candy.price);
    } else {
      ceoAddress.transfer(uint256(SafeMath.mul(SafeMath.div(candy.price, 100), 10)));
      candy.owner.transfer(uint256(SafeMath.mul(SafeMath.div(candy.price, 100), 90)));
    }

    candy.price = SafeMath.mul(SafeMath.div(candy.price, 100), 160);
    candy.owner = msg.sender;
    candy.last_transaction = block.timestamp;

    msg.sender.transfer(excess);
  }
}