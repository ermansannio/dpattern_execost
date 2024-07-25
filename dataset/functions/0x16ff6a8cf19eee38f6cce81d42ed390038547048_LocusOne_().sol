contract LocusOne {
function() public payable {
    require (!paused);    
    _split(msg.value);
    }
}