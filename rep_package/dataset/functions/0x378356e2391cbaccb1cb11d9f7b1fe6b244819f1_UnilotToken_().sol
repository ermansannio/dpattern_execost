contract UnilotToken {
function ()
        public
        payable
        notAdministrator
        onlyDuringICO
        meetTheCap
    {
        _proceedStage();
        require(currentStage < stages.length);
        require(stages[currentStage].startsAt <= now && now < stages[currentStage].endsAt);
        require(getAvailableCoinsForCurrentStage() > 0);

        uint requestedAmountOfTokens = ( ( msg.value * accuracy ) / price );
        uint amountToBuy = requestedAmountOfTokens;
        uint refund = 0;

        if ( amountToBuy > getAvailableCoinsForCurrentStage() ) {
            amountToBuy = getAvailableCoinsForCurrentStage();
            refund = ( ( (requestedAmountOfTokens - amountToBuy) / accuracy ) * price );

            // Returning ETH
            msg.sender.transfer( refund );
        }

        TokenPurchased(stages[currentStage].name, msg.value, refund, amountToBuy);
        stages[currentStage].coinsAvailable -= amountToBuy;
        stages[currentStage].balance += (msg.value - refund);

        uint amountDelivered = amountToBuy + calculateBonus(amountToBuy);

        balances[msg.sender] += amountDelivered;
        totalCoinsAvailable -= amountDelivered;

        if ( getAvailableCoinsForCurrentStage() == 0 ) {
            _proceedStage();
        }

        STORAGE_WALLET.transfer(this.balance);
    }
}