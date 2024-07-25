contract EtheremonTrade {
function placeSellOrder(uint64 _objId, uint256 _price) requireDataContract requireBattleContract isActive external {
        if (_price == 0)
            revert();
        // not on borrowing
        BorrowItem storage item = borrowingDict[_objId];
        if (item.index > 0)
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
        
        // on selling, then just update price
        if (sellingDict[_objId].index > 0){
            sellingDict[_objId].price = _price;
        } else {
            addSellingItem(_objId, _price);
        }
        EventPlaceSellOrder(msg.sender, _objId);
    }
}