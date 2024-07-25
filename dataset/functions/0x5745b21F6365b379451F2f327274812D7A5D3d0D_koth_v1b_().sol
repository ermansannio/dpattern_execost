contract koth_v1b {
function () payable public {
        // Current KOTH can't bet over themselves
        if (msg.sender == koth) {
            return;
        }

        // We're past the block target, but new game hasn't been activated
        if (lastBlock > 0 && block.number > lastBlock) {
            msg.sender.transfer(msg.value);
            return;
        }

        // Check for minimum bet (at least minRaise over current highestBet)
        if (msg.value < minBet) {
            msg.sender.transfer(msg.value);
            return;
        }

        // Check for maximum bet
        if (msg.value > maxBet) {
            msg.sender.transfer(msg.value);
            return;
        }

        // Bet was successful, crown new KOTH
        betId++;
        highestBet = msg.value;
        koth = msg.sender;
        pot += highestBet;

        // New bets
        minBet = highestBet + minRaise;
        if (pot < 1 ether) {
            maxBet = 3 * pot;
        } else {
            maxBet = 5 * pot / 4;
        }

        // Equation expects pot to be in Ether
        uint potEther = pot/1000000000000000000;
        uint blocksRemaining = (potEther ** 2)/2 - 8*potEther + 37;
        if (blocksRemaining < 6) {
            blocksRemaining = 3;
        }

        lastBlock = block.number + blocksRemaining;

        NewKoth(gameId, betId, koth, highestBet, pot, lastBlock);
    }
}