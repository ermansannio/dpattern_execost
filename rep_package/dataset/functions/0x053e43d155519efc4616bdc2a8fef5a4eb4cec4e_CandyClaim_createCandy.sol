contract CandyClaim {
function createCandy(string _candy_id, uint256 _price) public onlyCXX {
    require(msg.sender != address(0));
    _create_candy(_candy_id, address(this), _price);
  }
}