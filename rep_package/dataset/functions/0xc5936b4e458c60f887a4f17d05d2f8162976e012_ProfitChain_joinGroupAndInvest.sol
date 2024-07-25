contract ProfitChain {
function joinGroupAndInvest(uint32 _group, address _invitor) payable public {
        address investor = msg.sender;
        // owner is not allowed to invest
        require(msg.sender != owner);
        // check group exists, investor does not yet belong to group, and invitor exists (or owner)
        Group storage thisGroup = groups[_group];
        require(thisGroup.roundSize > 0);
        require(thisGroup.members[_invitor].joinTime > 0 || _invitor == owner);
        require(thisGroup.members[investor].joinTime == 0);
        // check payment is as required
        require(msg.value == thisGroup.investment);
        
        // add investor to group
        thisGroup.members[investor].joinTime = block.timestamp;
        thisGroup.members[investor].invitor = _invitor;
        
        // notify the world
        NewInvestor(investor, _group, block.timestamp);
        
        // make the first investment
        invest(_group);
    }
}