contract Bulletin {
function setMessage(string _message){
        require(msg.sender == owner);
        message = _message;
    }
}