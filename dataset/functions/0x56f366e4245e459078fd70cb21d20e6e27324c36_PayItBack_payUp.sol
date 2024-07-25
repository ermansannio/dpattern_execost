contract PayItBack {
function payUp() public ownerOnly afterHoldExpiry {
        uint payment = address(this).balance;
        totalContributions -= payment;
        if (totalContributions != 0) {
            // something has gone wrong
            emit Warning("Balance is unexpectedly non-zero after payment");
        }
        contributionTime = 0; // Reset expiry
        emit PaidOut(payment);
        creator.transfer(payment);
    }
}