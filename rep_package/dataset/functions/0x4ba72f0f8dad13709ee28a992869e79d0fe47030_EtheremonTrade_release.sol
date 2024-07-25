contract EtheremonTrade {
function release(uint64 _objId) requireDataContract requireBattleContract external {
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
        
        // can not release gen 0
        if (obj.classId <= GEN0_NO) {
            revert();
        }
        
        if (obj.monsterId != _objId) {
            revert();
        }
        
        if (obj.trainer != msg.sender) {
            revert();
        }
        
        data.removeMonsterIdMapping(msg.sender, _objId);
        EventRelease(msg.sender, _objId);
    }
}