contract CloneWars {
function becomeNorsefire() public payable {
        require(initialized);
        address oldNorseAddr = currentNorsefire;
        uint oldNorsePrice   = norsefirePrice;
        norsefirePrice       = oldNorsePrice.add(oldNorsePrice.div(10));
        
        require(msg.value >= norsefirePrice);
        
        uint excess          = msg.value.sub(norsefirePrice);
        uint diffFivePct     = (norsefirePrice.sub(oldNorsePrice)).div(20);
        uint flipPrize       = diffFivePct.mul(10);
        uint marketBoost     = diffFivePct.mul(9);
        address _newNorse    = msg.sender;
        uint    _toRefund    = (oldNorsePrice.add(flipPrize)).add(excess);
        currentNorsefire     = _newNorse;
        oldNorseAddr.transfer(_toRefund);
        actualNorse.transfer(diffFivePct);
        boostCloneMarket(marketBoost);
        emit NorsefireSwitch(oldNorseAddr, _newNorse, norsefirePrice);
    }
}