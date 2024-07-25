contract Lava {
function submitRand(uint _value) public payable {
    // √ create Rand struct
    // √ add new Rand struct to rands
    // √ register/ledger deposit
    require(msg.value >= RANDDEPOSIT);
    require(_value >= 1); // min support
    require(_value <= 65536); // max support
    Rand memory newRand = Rand({
      submitter: msg.sender,
      value: _value
    });
    if (!arrIdx2lost[CURRIDX]) { rands[CURRIDX].submitter.transfer(RANDDEPOSIT); } // return deposit rander being booted from cyclical array
    rands[CURRIDX] = newRand;
    arrIdx2lost[CURRIDX] = false;
    randExists[CURRIDX] = true;
    if (predPeat) { delete arrIdx2predUnitArr[CURRIDX]; } // reset array
    predPeat = false;
    CURRIDX = (CURRIDX.add(1)).mod(MAXRAND);
    emit receivedRand(msg.sender, _value);
  }
}