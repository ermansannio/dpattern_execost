contract ETHERKUN {
function feed100(uint _kunId) external onlyOwnerOf(_kunId) payable {
    require(msg.value == testFee * 100);
    kun storage mykun = kuns[_kunId];
    uint oldAtk = mykun.atk;
    uint random = randMod();
    if (random < 20) {
        mykun.atk = mykun.atk.add(6000);
    } else if (random < 70) {
        mykun.atk = mykun.atk.add(12000);
    } else if (random < 90) {
        mykun.atk = mykun.atk.add(24000);
    } else {
         mykun.atk = mykun.atk.add(60000);
    }
    mykun.price = mykun.price.add(msg.value);
    _triggerCooldown(mykun);
    Evolution(msg.sender, _kunId, mykun.atk, oldAtk);
  }
}