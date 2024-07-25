contract ProfitChain {
function closeGroup(uint32 _group) onlyOwner public {
        // verify group exists and not closed
        require(groupExists(_group));
        require(groups[_group].active);
        
        groups[_group].active = false;

        // notify the world
        GroupClosed(_group, block.timestamp);
    }
}