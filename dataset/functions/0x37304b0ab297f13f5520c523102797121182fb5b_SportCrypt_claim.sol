contract SportCrypt {
function claim(uint matchId, uint8 finalPrice, bytes32 r, bytes32 s, uint8 v) external {
        var m = matches[matchId];

        if (m.finalized) {
            require(m.finalPrice == finalPrice);
        } else {
            uint messageHash = uint(keccak256(this, matchId, finalPrice));
            address signer = ecrecover(keccak256("x19Ethereum Signed Message:n32", messageHash), v, r, s);
            require(admins[signer]);
            require(finalPrice <= 100);

            m.finalized = true;
            m.finalPrice = finalPrice;
            LogFinalizeMatch(matchId, finalPrice);
        }

        // NOTE: final prices other than 0 and 100 may leave very small amounts of unrecoverable dust in the contract due to rounding.

        int delta = 0;
        int senderPosition = m.positions[msg.sender];

        if (senderPosition > 0) {
            delta = priceDivide(senderPosition, finalPrice);
        } else if (senderPosition < 0) {
            delta = priceDivide(-senderPosition, 100 - finalPrice);
        } else {
            return;
        }

        assert(delta >= 0);

        m.positions[msg.sender] = 0;
        adjustBalance(msg.sender, delta);

        LogClaim(msg.sender, matchId, uint(delta));
    }
}