contract Ranking {
function createRecord (string _name, string _link) external payable {
        require(msg.value >= 0.001 ether);
        require(_utfStringLength(_name) <= 20);
        require(_utfStringLength(_link) <= 50);
        uint id = records.push(Record(msg.value, _name, _link)) - 1;
        CreateEvent(id, msg.value, _name, _link);
    }
}