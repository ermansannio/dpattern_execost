contract ProfitChain {
function newGroup (
        string _groupName, 
        uint32 _roundSize,
        uint256 _investment,
        uint32 _blocksBeforeWinCheck,
        uint32 _securityFactor,
        uint32 _invitationFee,
        uint32 _ownerFee,
        uint32 _invitationFeePeriod,
        uint8 _invitationFeeDepth
    ) public onlyOwner 
    {
        // some basic tests
        require(_roundSize > 0);
        require(_investment > 0);
        require(_invitationFee.add(_ownerFee) < 1000);
        require(_securityFactor > _roundSize);
        // check if group name exists
        require(!groupNameExists(_groupName));
        
        // create the group
        Group memory group;
        group.name = _groupName;
        group.roundSize = _roundSize;
        group.investment = _investment;
        group.blocksBeforeWinCheck = _blocksBeforeWinCheck;
        group.securityFactor = _securityFactor;
        group.invitationFee = _invitationFee;
        group.ownerFee = _ownerFee;
        group.invitationFeePeriod = _invitationFeePeriod;
        group.invitationFeeDepth = _invitationFeeDepth;
        group.active = true;
        // group.currentRound = 0; // initialized with 0 anyway
        // group.firstUnwonRound = 0; // initialized with 0 anyway
        
        groups.push(group);
        groupNames[_groupName] = true;

        // notify world
        GroupCreated(uint32(groups.length).sub(1), block.timestamp);
    }
}