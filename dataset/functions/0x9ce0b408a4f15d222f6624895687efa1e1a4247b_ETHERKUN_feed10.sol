contract ETHERKUN {
function feed10(uint _kunId) external onlyOwnerOf(_kunId) payable {
    require(msg.value == testFee * 10);
    kun storage mykun = kuns[_kunId];
    uint oldAtk = mykun.atk;
    uint random = randMod();
    if (random < 20) {
        mykun.atk = mykun.atk.add(550);
    } else if (random < 70) {
        mykun.atk = mykun.atk.add(1100);
    } else if (random < 90) {
        mykun.atk = mykun.atk.add(2200);
    } else {
         mykun.atk = mykun.atk.add(5500);
    }
    mykun.price = mykun.price.add(msg.value);
    _triggerCooldown(mykun);
    Evolution(msg.sender, _kunId, mykun.atk, oldAtk);
  }
}