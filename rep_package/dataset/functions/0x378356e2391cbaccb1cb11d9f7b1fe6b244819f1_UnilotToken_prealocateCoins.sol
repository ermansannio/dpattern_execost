contract UnilotToken {
function prealocateCoins()
        public
        onlyAdministrator
    {
        totalCoinsAvailable -= balances[ADVISORS_WALLET] += ( ( _totalSupply * DST_ADVISERS ) / 100 );
        totalCoinsAvailable -= balances[RESERVE_WALLET] += ( ( _totalSupply * DST_RESERVE ) / 100 );

        address[7] memory teamWallets = getTeamWallets();
        uint teamSupply = ( ( _totalSupply * DST_TEAM ) / 100 );
        uint memberAmount = teamSupply / teamWallets.length;

        for(uint i = 0; i < teamWallets.length; i++) {
            if ( i == ( teamWallets.length - 1 ) ) {
                memberAmount = teamSupply;
            }

            balances[teamWallets[i]] += memberAmount;
            teamSupply -= memberAmount;
            totalCoinsAvailable -= memberAmount;
        }
    }
}