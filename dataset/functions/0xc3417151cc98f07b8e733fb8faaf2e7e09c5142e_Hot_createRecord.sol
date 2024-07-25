contract Hot {
function createRecord (string _name, string _link) external payable {
        require(msg.value >= 0.001 ether);
        require(_utfStringLength(_name) <= 20);
        require(_utfStringLength(_link) <= 50);
        records.push(Record(records.length,msg.value, _name, _link));
        emit CreateEvent(records.length-1, msg.value, _name, _link);
    }
}