contract TheNextBlock {
function placeBet(address _miner) 
        public
        payable
        notContract(msg.sender)
        notLess
        notMore
        onlyOnce {
            
            totalBetCount = totalBetCount.add(1);
            BetReceived(msg.sender, _miner, block.coinbase);

            owner.balance = owner.balance.add( safeGetPercent(allowedBetAmount, ownerProfitPercent) );
            prizePool = prizePool.add( safeGetPercent(allowedBetAmount, prizePoolPercent) );
            nextPrizePool = nextPrizePool.add( safeGetPercent(allowedBetAmount, nextPrizePoolPercent) );

            if(_miner == block.coinbase) {
                
                playersPoints[msg.sender]++;

                if(playersPoints[msg.sender] == requiredPoints) {
                    
                    if(prizePool >= allowedBetAmount) {
                        Jackpot(msg.sender, prizePool);
                        playersStorage[msg.sender].balance = playersStorage[msg.sender].balance.add(prizePool);
                        prizePool = nextPrizePool;
                        nextPrizePool = 0;
                        playersPoints[msg.sender] = 0;
                    } else {
                        playersPoints[msg.sender]--;
                    }
                }

            } else {
                playersPoints[msg.sender] = 0;
            }
    }
}