contract Dice2Win {
function placeBet(uint betMask, uint modulo,
                      uint commitLastBlock, uint commit, bytes32 r, bytes32 s) external payable {
        // Check that the bet is in 'clean' state.
        Bet storage bet = bets[commit];
        require (bet.gambler == address(0));

        // Validate input data ranges.
        uint amount = msg.value;
        require (modulo > 1 && modulo <= MAX_MODULO);
        require (amount >= MIN_BET && amount <= MAX_AMOUNT);
        require (betMask > 0 && betMask < MAX_BET_MASK);

        // Check that commit is valid - it has not expired and its signature is valid.
        require (block.number <= commitLastBlock);
        bytes32 signatureHash = keccak256(abi.encodePacked(uint40(commitLastBlock), commit));
        require (secretSigner == ecrecover(signatureHash, 27, r, s));

        uint rollUnder;
        uint mask;

        if (modulo <= MAX_MASK_MODULO) {
            // Small modulo games specify bet outcomes via bit mask.
            // rollUnder is a number of 1 bits in this mask (population count).
            // This magic looking formula is an efficient way to compute population
            // count on EVM for numbers below 2**40. For detailed proof consult
            // the dice2.win whitepaper.
            rollUnder = ((betMask * POPCNT_MULT) & POPCNT_MASK) % POPCNT_MODULO;
            mask = betMask;
        } else {
            // Larger modulos specify the right edge of half-open interval of
            // winning bet outcomes.
            require (betMask > 0 && betMask <= modulo);
            rollUnder = betMask;
        }

        // Winning amount and jackpot increase.
        uint possibleWinAmount = getDiceWinAmount(amount, modulo, rollUnder);
        uint jackpotFee = getJackpotFee(amount);

        // Enforce max profit limit.
        require (possibleWinAmount <= amount + maxProfit);

        // Lock funds.
        lockedInBets += uint128(possibleWinAmount);
        jackpotSize += uint128(jackpotFee);

        // Check whether contract has enough funds to process this bet.
        require (jackpotSize + lockedInBets <= address(this).balance);

        // Store bet parameters on blockchain.
        bet.amount = amount;
        bet.modulo = uint8(modulo);
        bet.rollUnder = uint8(rollUnder);
        bet.placeBlockNumber = uint40(block.number);
        bet.mask = uint40(mask);
        bet.gambler = msg.sender;
    }
}