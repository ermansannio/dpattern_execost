contract EtheremonTrade {
function buyItem(uint64 _objId) requireDataContract requireBattleContract isActive external payable {
        // check item is valid to sell 
        uint256 requestPrice = sellingDict[_objId].price;
        if (requestPrice == 0 || msg.value != requestPrice) {
            revert();
        }
        
        // check obj
        EtheremonDataBase data = EtheremonDataBase(dataContract);
        MonsterObjAcc memory obj;
        uint32 _ = 0;
        (obj.monsterId, obj.classId, obj.trainer, obj.exp, _, _, obj.createTime) = data.getMonsterObj(_objId);
        if (obj.monsterId != _objId) {
            revert();
        }
        // can not buy from yourself
        if (obj.trainer == msg.sender) {
            revert();
        }
        
        address oldTrainer = obj.trainer;
        uint256 fee = requestPrice * tradingFeePercentage / 100;
        removeSellingItem(_objId);
        transferMonster(msg.sender, _objId);
        oldTrainer.transfer(safeSubtract(requestPrice, fee));
        
        SoldItem memory soldItem = SoldItem(_objId, requestPrice, block.timestamp);
        soldList[oldTrainer].push(soldItem);
        EventBuyItem(msg.sender, _objId);
    }
}