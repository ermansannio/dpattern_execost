contract DecenterHackathon {
function vote(address[] _votes) onlyJury {
        require(currentPeriod == Period.Voting);
        require(_votes.length == teamAddresses.length);
        require(juryMembers[msg.sender].hasVoted == false);

        uint _points = _votes.length;

        for(uint i = 0; i < _votes.length; i++) {
            address teamAddress = _votes[i];

            // All submitted teams must be registered
            require(bytes(teams[teamAddress].name).length > 0);

            // Judge should not be able to vote for the same team more than once
            require(teams[teamAddress].votedForByJuryMember[msg.sender] == false);

            teams[teamAddress].score += _points;
            teams[teamAddress].votedForByJuryMember[msg.sender] = true;

            VoteReceived(juryMembers[msg.sender].name, teamAddress, _points);
            _points--;
        }

        // This will prevent jury members from voting more than once
        juryMembers[msg.sender].hasVoted = true;
    }
}