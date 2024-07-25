contract Bombs {
function addBomb(uint8 __id, uint256 __price, uint8 __chance, uint8 __increase) public onlyCEO {
    bombs[__id] = Bomb(msg.sender, 0, __chance, __increase, __price, 0, __price, 0, 0, address(0), 0, address(0));
  }
}