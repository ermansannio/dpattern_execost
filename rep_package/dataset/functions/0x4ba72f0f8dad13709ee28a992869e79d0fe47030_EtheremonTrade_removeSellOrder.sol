contract EtheremonTrade {
function removeSellOrder(uint64 _objId) requireDataContract requireBattleContract isActive external {
        if (sellingDict[_objId].index == 0)
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
        
        removeSellingItem(_objId);
    }
}