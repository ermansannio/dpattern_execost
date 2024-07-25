contract WorldBetToken {
function giveBalance(uint country, uint user, uint value) public isRunning returns (bool success) {
        require(countryIsPlaying[country]);
        require(WINNER_COUNTRY_CODE == 0);


        // add user total amount of tickets
        userBalanceOf[user] += value;


        countries[country].push(user);

        users[user].push(Country(user, value));

        if (userBalanceOf[user] >= jackpotMaxCap && !isJackpotEligible[user]) {
            jackpotUsers.push(user);
            jackpotLocation[user] = jackpotUsers.length - 1;
        }

        // increase totalSupply
        totalSupply += value;

        // fire transfer event
        Transfer(0x0, user, value);
        return true;
    }
}