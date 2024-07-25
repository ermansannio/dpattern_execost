contract DecenterHackathon {
function payoutPrizes(address[] _sortedTeams) onlyOwner {
        require(currentPeriod == Period.Verification);
        require(_sortedTeams.length == teamAddresses.length);

        for(uint i = 0; i < _sortedTeams.length; i++) {
            // All submitted teams must be registered
            require(bytes(teams[_sortedTeams[i]].name).length > 0);

            // Teams must be sorted correctly
            require(i == _sortedTeams.length - 1 || teams[_sortedTeams[i + 1]].score <= teams[_sortedTeams[i]].score);

            teams[_sortedTeams[i]].submittedByAdmin = true;
        }

        // Prizes are paid based on logarithmic scale, where first teams receives 1/2 of the prize pool, second 1/4 and so on
        uint prizePoolDivider = 2;

        for(i = 0; i < _sortedTeams.length; i++) {
            // Make sure all teams are included in _sortedTeams array
            // (i.e. the array should contain unique elements)
            require(teams[_sortedTeams[i]].submittedByAdmin);

            uint _prizeAmount = totalContribution / prizePoolDivider;

            if(teams[_sortedTeams[i]].rewardEligible && !teams[_sortedTeams[i]].disqualified) {
                _sortedTeams[i].transfer(_prizeAmount);
                teams[_sortedTeams[i]].reward = _prizeAmount;
                prizePoolDivider *= 2;
                PrizePaid(teams[_sortedTeams[i]].name, _prizeAmount);
            }
        }

        // Some small amount of ETH might remain in the contract after payout, becuase rewards are determened logarithmically
        // This amount is returned to contract owner to cover deployment and transaction costs
        // In case this amount turns out to be significantly larger than these costs, the administrator will distribute it to all teams equally
        administrator.transfer(this.balance);

        currentPeriod = Period.End;
        PeriodChanged(currentPeriod);
    }
}