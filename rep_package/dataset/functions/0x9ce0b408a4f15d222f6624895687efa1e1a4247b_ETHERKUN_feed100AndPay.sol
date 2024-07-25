contract ETHERKUN {
function feed100AndPay(uint _kunId) external onlyOwnerOf(_kunId) payable {
    require(msg.value == testFee * 110);
    kun storage mykun = kuns[_kunId];
    uint oldAtk = mykun.atk;
    mykun.atk = mykun.atk.add(60000);
    mykun.price = mykun.price.add(testFee * 100);
    owner.transfer(testFee * 10);
    _triggerCooldown(mykun);
    Evolution(msg.sender, _kunId, mykun.atk, oldAtk);
  }
}