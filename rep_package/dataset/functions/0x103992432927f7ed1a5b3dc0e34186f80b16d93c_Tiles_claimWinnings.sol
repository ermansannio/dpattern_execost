contract Tiles {
function claimWinnings() {
        if (pendingWithdrawals[msg.sender] != 0) {
            if (msg.sender.send(pendingWithdrawals[msg.sender])) {
                WinningsClaimed(msg.sender, pendingWithdrawals[msg.sender]);
                pendingWithdrawals[msg.sender] = 0;
            } else {
                FailedToClaim(msg.sender, pendingWithdrawals[msg.sender]);
            }
        }
    }
}