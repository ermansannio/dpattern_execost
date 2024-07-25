contract Nines {
function purchase() public payable {
    require(msg.sender != address(0));
    require(msg.value >= seatPrice);
    uint256 excess = SafeMath.sub(msg.value, seatPrice);
    nines[1].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 9)));
    nines[2].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 9)));
    nines[3].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 9)));
    nines[4].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 9)));
    nines[5].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 9)));
    nines[6].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 9)));
    nines[7].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 9)));
    nines[8].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 9)));
    nines[9].owner.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 9)));
    nines[9] = nines[8]; nines[8] = nines[7]; nines[7] = nines[6];
    nines[6] = nines[5]; nines[5] = nines[4]; nines[4] = nines[3];
    nines[3] = nines[2]; nines[2] = nines[1];
    nines[1] = Nine(msg.sender, seatPrice);
    ceoAddress.transfer(uint256(SafeMath.mul(SafeMath.div(seatPrice, 100), 19)));
    NewOne(msg.sender, seatPrice, SafeMath.mul(SafeMath.div(seatPrice, 100), 109));
    seatPrice = SafeMath.mul(SafeMath.div(seatPrice, 100), 109);
    msg.sender.transfer(excess);
  }
}