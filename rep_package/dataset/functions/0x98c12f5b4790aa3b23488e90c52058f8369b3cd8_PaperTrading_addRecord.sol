contract PaperTrading {
function addRecord(bytes32 shasum,string remarks) public returns (uint256 recordID) {
        recordID = record.length++;
        rebalance storage Reb = record[recordID];
        Reb.creator=msg.sender;
        Reb.shasum=shasum;
        Reb.time = block.timestamp;
        Reb.blocknum = block.number;
        Reb.remarks = remarks;
        LogRebalance(Reb.creator,Reb.shasum,Reb.remarks,Reb.time,Reb.blocknum,recordID);
}
}