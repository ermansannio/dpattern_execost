contract Ranking {
function supportRecord(uint _id) external payable {
        require(msg.value >= 0.001 ether);
        require(_id < records.length);
        records[_id].bid += msg.value;
        SupportEvent (_id, records[_id].bid);
    }
}