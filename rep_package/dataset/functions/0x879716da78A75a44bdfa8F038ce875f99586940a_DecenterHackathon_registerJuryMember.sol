contract DecenterHackathon {
function registerJuryMember(string _name, address _ethAddress) onlyOwner {
        require(currentPeriod == Period.Registration);

        juryMemberAddresses.push(_ethAddress);
        juryMembers[_ethAddress] = JuryMember({
            name: _name,
            hasVoted: false
        });

        JuryMemberAdded(_name, _ethAddress);
    }
}