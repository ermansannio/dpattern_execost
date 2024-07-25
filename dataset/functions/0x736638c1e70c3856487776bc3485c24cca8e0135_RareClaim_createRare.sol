contract RareClaim {
function createRare(string _rare_id, uint256 _price) public onlyCXX {
    require(msg.sender != address(0));
    _create_rare(_rare_id, address(this), _price);
  }
}