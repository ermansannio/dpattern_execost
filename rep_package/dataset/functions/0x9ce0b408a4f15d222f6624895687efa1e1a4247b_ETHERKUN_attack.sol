contract ETHERKUN {
function attack(uint _kunId, uint _targetId) external onlyOwnerOf(_kunId) {
    kun storage mykun = kuns[_kunId];
    kun storage enemykun = kuns[_targetId]; 
    require(_isReady(enemykun));
    require(enemykun.atk > 299 && mykun.atk > 0);
    uint rand = randMod();
    uint probability = mykun.atk * 100 /(mykun.atk + enemykun.atk) ;
    
    if (rand < probability) {
        //win
        msg.sender.transfer(enemykun.price);
        kunAttackResult(msg.sender, mykun.atk, kunToOwner[_targetId], enemykun.atk, rand, enemykun.price);
        enemykun.price = 0;
        enemykun.atk = 0;
        mykun.readyTime = now;
    } else {
        //loss
        uint award1 = mykun.price*9/10;
        kunToOwner[_targetId].transfer(award1);
        owner.transfer(mykun.price - award1);
        kunAttackResult(msg.sender, mykun.atk, kunToOwner[_targetId], enemykun.atk, rand, mykun.price*9/10);
        mykun.price = 0;
        mykun.atk = 0;
    }
  }
}