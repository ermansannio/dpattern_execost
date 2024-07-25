contract EtheremonTrade {
function removeBorrowingOfferItem(uint64 _objId) requireDataContract requireBattleContract isActive external {
        BorrowItem storage item = borrowingDict[_objId];
        if (item.index == 0)
            revert();
        
        if (item.owner != msg.sender)
            revert();
        if (item.lent == true)
            revert();
        
        removeBorrowingItem(_objId);
    }
}