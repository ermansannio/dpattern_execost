contract EtheremonTrade {
function getBackLendingItem(uint64 _objId) requireDataContract requireBattleContract isActive external {
        BorrowItem storage item = borrowingDict[_objId];
        if (item.index == 0)
            revert();
        if (item.lent == false)
            revert();
        if (item.releaseTime > block.timestamp)
            revert();
        
        if (msg.sender != item.owner)
            revert();
        
        removeBorrowingItem(_objId);
        transferMonster(msg.sender, _objId);
        removeItemLendingList(msg.sender, _objId);
        EventGetBackItem(msg.sender, _objId);
    }
}