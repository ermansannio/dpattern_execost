contract EtheremonTrade {
function borrowItem(uint64 _objId) requireDataContract requireBattleContract isActive external payable {
        BorrowItem storage item = borrowingDict[_objId];
        if (item.index == 0)
            revert();
        if (item.lent == true)
            revert();
        uint256 itemPrice = item.price;
        if (itemPrice != msg.value)
            revert();
        

        // check obj
        EtheremonDataBase data = EtheremonDataBase(dataContract);
        MonsterObjAcc memory obj;
        uint32 _ = 0;
        (obj.monsterId, obj.classId, obj.trainer, obj.exp, _, _, obj.createTime) = data.getMonsterObj(_objId);
        if (obj.monsterId != _objId) {
            revert();
        }
        // can not borrow from yourself
        if (obj.trainer == msg.sender) {
            revert();
        }
        
        uint256 fee = itemPrice * tradingFeePercentage / 100;
        item.borrower = msg.sender;
        item.releaseTime += block.timestamp;
        item.lent = true;
        address oldOwner = obj.trainer;
        transferMonster(msg.sender, _objId);
        oldOwner.transfer(safeSubtract(itemPrice, fee));
        addItemLendingList(oldOwner, _objId);
        EventAcceptBorrowItem(msg.sender, _objId);
    }
}