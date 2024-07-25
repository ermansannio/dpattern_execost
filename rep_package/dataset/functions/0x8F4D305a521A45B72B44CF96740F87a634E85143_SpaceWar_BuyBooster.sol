contract SpaceWar {
function BuyBooster() external payable
    {
        require(msg.value >= nextBoosterPrice);
        require(miners[msg.sender].lastUpdateTime != 0);

        for(uint i = 0; i < NUMBER_OF_BOOSTERS; ++i)
            if(boosterHolders[i] == msg.sender)
                revert();

        address beneficiary = boosterHolders[boosterIndex];

        MinerData storage m = miners[beneficiary];

        // 20% interest after 5 buys
        m.unclaimedPot += (msg.value * 9403) / 10000;

        // distribute the rest
        honeyPotAmount += (msg.value * 597) / 20000;
        devFund += (msg.value * 597) / 20000;

        // increase price by 5%
        nextBoosterPrice += nextBoosterPrice / 20;

        UpdateMoney();
        UpdateMoneyAt(beneficiary);

        // transfer ownership
        boosterHolders[boosterIndex] = msg.sender;

        // increase booster index
        boosterIndex += 1;
        if(boosterIndex >= 5)
            boosterIndex = 0;
    }
}