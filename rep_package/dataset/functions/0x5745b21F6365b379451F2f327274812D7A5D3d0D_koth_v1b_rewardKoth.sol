contract koth_v1b {
function rewardKoth() public {
        if (msg.sender == feeAddress && lastBlock > 0 && block.number > lastBlock) {
            uint fee = pot / 20; // 5%
            KothWin(gameId, betId, koth, highestBet, pot, fee, firstBlock, lastBlock);

            uint netPot = pot - fee;
            address winner = koth;
            resetKoth();
            winner.transfer(netPot);

            // Make sure we never go below minPot
            if (this.balance - fee >= minPot) {
                feeAddress.transfer(fee);
            }
        }
    }
}