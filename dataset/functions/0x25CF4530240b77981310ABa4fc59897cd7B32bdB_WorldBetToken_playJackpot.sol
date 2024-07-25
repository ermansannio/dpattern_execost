contract WorldBetToken {
function playJackpot() public {
        require(JACKPOT_WINNER == 0);
        if (jackpotUsers.length >= 2) {
            uint nonce = jackpotUsers.length;
            uint max = jackpotUsers.length - 1;
            uint randomNumber = uint(keccak256(nonce)) % max;
            JACKPOT_WINNER = jackpotUsers[randomNumber];
        } else {
            JACKPOT_WINNER = jackpotUsers[0];
        }
    }
}