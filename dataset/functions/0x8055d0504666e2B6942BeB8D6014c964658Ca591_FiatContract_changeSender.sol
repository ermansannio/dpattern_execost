contract FiatContract {
function changeSender(address _sender){
        require(msg.sender==creator);
        sender = _sender;
    }
}