contract Bombs {
function buy(uint8 _bomb) public payable {
    require(msg.sender != address(0));
    Bomb storage bomb = bombs[_bomb];
    require(msg.value >= bomb.price);

    uint256 excess = SafeMath.sub(msg.value, bomb.price);
    uint256 diff = SafeMath.sub(bomb.price, bomb.last_price);
    
    uint _random = uint(keccak256(block.blockhash(block.number-1),msg.gas,tx.gasprice,block.timestamp))%bomb.chance + 1;
    
    if(_random == 1){
      bomb.owner.transfer(SafeMath.add(bomb.last_price, SafeMath.add(bomb.pot, SafeMath.mul(SafeMath.div(diff, 100), 50))));
      ceoAddress.transfer(SafeMath.mul(SafeMath.div(diff, 100), 50));

      bomb.last_winner = bomb.owner;
      bomb.last_pot = bomb.pot;
      bomb.last_bumps = bomb.bumps;
      bomb.made_explode = msg.sender;
      
      bomb.price = bomb.base_price;
      bomb.owner = ceoAddress;
      bomb.pot = 0;
      bomb.bumps = 0;
      
    } else {
      bomb.owner.transfer(SafeMath.mul(SafeMath.div(diff, 100), 20));
      bomb.owner.transfer(bomb.last_price);
      if(bomb.made_explode == address(0)){
        ceoAddress.transfer(SafeMath.mul(SafeMath.div(diff, 100), 30)); 
      } else {
        ceoAddress.transfer(SafeMath.mul(SafeMath.div(diff, 100), 25));
        bomb.made_explode.transfer(SafeMath.mul(SafeMath.div(diff, 100), 5));
      }
      bomb.pot += SafeMath.mul(SafeMath.div(diff, 100), 50);
      bomb.owner = msg.sender;
    
      bomb.last_price = bomb.price;
      bomb.price = SafeMath.mul(SafeMath.div(bomb.price, 100), bomb.increase);
      bomb.bumps += 1;

      msg.sender.transfer(excess);
    }
  }
}