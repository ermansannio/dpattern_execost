contract VotingPowerDelegator {
function delegate(address beneficiary) public {
        if (beneficiary == msg.sender) {
            beneficiary = 0;
        }
        delegations[msg.sender] = beneficiary;
        delegatedAt[msg.sender] = now;
        emit Delegated(msg.sender, beneficiary);
    }
}