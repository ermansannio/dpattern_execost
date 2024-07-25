contract Big2018Token {
function () external payable {
        // must buy whole token when minting new here, but can buy/sell fractions between eachother
        require(now >= start2018 && now <= end2018); //must be in 2018
        uint priceWei = this.getPriceWei(0); //get todays price
        uint256 giveTokens = msg.value / priceWei; //rounds down to no of tokens that can afford
            if (tokensToday + giveTokens > tokensDaily) { //if asking for tokens than left today
                giveTokens = tokensDaily - tokensToday;    //then limit giving to remaining tokens
                }
        countBuy += 1; //count usage
        tokensToday += giveTokens; //count whole tokens issued today
        box[msg.sender] = this.boxChoice(0); //assign box number to buyer
        _transfer(this, msg.sender, giveTokens * 10 ** uint256(decimals)); //transfer tokens from this contract
        uint256 changeDue = msg.value - (giveTokens * priceWei) * 99 / 100; //calculate change due, charged 1% to disincentivise high volume full refund calls.
        require(changeDue < msg.value); //make sure refund is not more than input
        msg.sender.transfer(changeDue); //give change
        
    }
}