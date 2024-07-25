contract DiceGame {
function placeBet(uint8 roll, bool lessThan, uint affID, uint lastBlock, bytes32 commit, uint8 v, bytes32 r, bytes32 s) public payable {
        uint amount = msg.value;
        require(amount >= minBet, "Amount is less than minimum bet size");
        require(roll >= minNumber && roll <= maxNumber, "Place number should be with rang.");
        require(block.number < lastBlock, "Commit has expired.");

        bytes32 signatureHash = keccak256(abi.encodePacked(lastBlock, commit));
        require(signer == ecrecover(signatureHash, v, r, s), "ECDSA signature is not valid.");

        Bet storage bet = bets[commit];
        require(bet.player == address(0x0));

        bool isInvited = affID > 150000 && affID <= pID;

        uint profit = getDiceWinAmount(amount, roll, lessThan, isInvited);

        require(profit <= amount + maxProfit, "maxProfit limit violation.");

        maxPendingPayouts = maxPendingPayouts.add(profit);

        require(maxPendingPayouts < address(this).balance, "insufficient contract balance for payout.");


        bet.amount = amount;
        bet.placeBlockNumber = uint40(block.number);
        bet.roll = roll;
        bet.lessThan = lessThan;
        bet.isInvited = isInvited;
        bet.player = msg.sender;

        emit LogBet(commit, msg.sender, amount, bet.roll, bet.lessThan, now);

        if (isInvited) {
            address affAddress = playerAddrIdx[affID];
            playerPendingWithdrawals[affAddress] = playerPendingWithdrawals[affAddress].add(amount.div(200));
        }


    }
}