contract EtheremonTrade {
function offerBorrowingItem(uint64 _objId, uint256 _price, uint _releaseTime) requireDataContract requireBattleContract isActive external {
        // make sure it is not on sale 
        if (sellingDict[_objId].price > 0 || _price == 0)
            revert();
        // not on lent
        BorrowItem storage item = borrowingDict[_objId];
        if (item.lent == true)
            revert();
        // not on battle 
        EtheremonBattleInterface battle = EtheremonBattleInterface(battleContract);
        if (battle.isOnBattle(_objId))
            revert();
        
        
        // check ownership
        EtheremonDataBase data = EtheremonDataBase(dataContract);
        MonsterObjAcc memory obj;
        uint32 _ = 0;
        (obj.monsterId, obj.classId, obj.trainer, obj.exp, _, _, obj.createTime) = data.getMonsterObj(_objId);
        
        if (obj.monsterId != _objId) {
            revert();
        }
        
        if (obj.trainer != msg.sender) {
            revert();
        }
        
        if (item.index > 0) {
            // update info 
            item.price = _price;
            item.releaseTime = _releaseTime;
        } else {
            addBorrowingItem(msg.sender, _objId, _price, _releaseTime);
        }
        EventOfferBorrowingItem(msg.sender, _objId);
    }
}