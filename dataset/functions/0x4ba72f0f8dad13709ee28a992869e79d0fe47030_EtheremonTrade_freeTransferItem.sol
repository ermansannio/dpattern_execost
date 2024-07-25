contract EtheremonTrade {
function freeTransferItem(uint64 _objId, address _receiver) requireDataContract requireBattleContract external {
        // make sure it is not on sale 
        if (sellingDict[_objId].price > 0)
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
        
        transferMonster(_receiver, _objId);
        EventFreeTransferItem(msg.sender, _receiver, _objId);
    }
}