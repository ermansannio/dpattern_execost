contract FueldToken {
function() payable public { 
        require(startTimeICO > 0 || startTimePreICO > 0);
        require(msg.sender != address(0));
        require(msg.value > 0);
        require(cap < hardCap);
        uint256 bonusPercent = currentBonusPercent();
        uint256 currentPrice = price.mul(100 - bonusPercent).div(100);
        address depositor = msg.sender;
        uint256 deposit = msg.value;
        uint256 tokens = deposit/currentPrice;
        if (startTimeICO > 0){
            require(soldTokenCount.add(tokens) <= maxPreICOandICOSupply);
        }
        else{
            if(startTimePrivatePreICO > 0) {
                tokens = (tokens * (100 + privatePreICOFreeBonusPercent)) / 100;
            }
            else {
                tokens = (tokens * (100 + preICOFreeBonusPercent)) / 100;
            }
            require(soldTokenCount.add(tokens) <= maxPreICOSupply);
        }

        balances[owner] = balances[owner].sub(tokens);
        balances[depositor] = balances[depositor].add(tokens);
        soldTokenCount = soldTokenCount.add(tokens);
        if (startTimeICO > 0){
            ICObalances[depositor] = ICObalances[depositor].add(tokens);
        }

        if (startTimeICO > 0){
            ICOdepositors[depositor] = ICOdepositors[depositor].add(deposit);
        }
        else{
            if(startTimePrivatePreICO > 0) {
                privatePreICOdepositors[depositor] = privatePreICOdepositors[depositor].add(deposit);
            }
            else {
                preICOdepositors[depositor] = preICOdepositors[depositor].add(deposit);
            }
        }
        cap = cap.add(deposit);
        if(startTimePreICO > 0) {
            capPreICO = capPreICO.add(deposit);
        }

        capFiatAndETH = capFiat.add(cap);
        if(capFiatAndETH >= softCap) {
            capReached = true;
        }
        TokenPurchase(owner, depositor, deposit, tokens);
    }
}