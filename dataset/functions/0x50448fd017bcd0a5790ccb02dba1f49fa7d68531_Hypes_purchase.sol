contract Hypes {
function purchase() public payable {
    require(msg.sender != address(0));
    require(msg.value >= seatPrice);
    uint256 excess = SafeMath.sub(msg.value, seatPrice);
    hypes[1].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 2)));
    hypes[2].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 4)));
    hypes[3].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 6)));
    hypes[4].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 8)));
    hypes[5].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 10)));
    hypes[6].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 12)));
    hypes[7].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 14)));
    hypes[8].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 16)));
    hypes[9].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 18)));
    hypes[9] = hypes[8]; hypes[8] = hypes[7]; hypes[7] = hypes[6];
    hypes[6] = hypes[5]; hypes[5] = hypes[4]; hypes[4] = hypes[3];
    hypes[3] = hypes[2]; hypes[2] = hypes[1];
    hypes[1] = Hype(msg.sender, seatPrice);
    ceoAddress.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 10)));
    NewOne(msg.sender, seatPrice, SafeMath.mul(SafeMath.div(seatPrice, 100), 120));
    seatPrice = SafeMath.mul(SafeMath.div(seatPrice, 100), 120);
    msg.sender.transfer(excess);
  }
}