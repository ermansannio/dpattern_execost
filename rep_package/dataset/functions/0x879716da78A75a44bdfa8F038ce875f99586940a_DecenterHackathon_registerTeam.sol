contract DecenterHackathon {
function registerTeam(string _name, address _teamAddress, string _memberNames, bool _rewardEligible) onlyOwner {
        require(currentPeriod == Period.Registration);
        require(bytes(teams[_teamAddress].name).length == 0);

        teams[_teamAddress] = Team({
            name: _name,
            memberNames: _memberNames,
            score: 0,
            reward: 0,
            rewardEligible: _rewardEligible,
            submittedByAdmin: false,
            disqualified: false
        });

        teamAddresses.push(_teamAddress);
        TeamRegistered(_name, _teamAddress, _memberNames, _rewardEligible);
    }
}