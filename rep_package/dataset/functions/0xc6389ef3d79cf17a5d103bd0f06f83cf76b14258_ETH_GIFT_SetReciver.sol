contract ETH_GIFT {
function SetReciver(address _reciver) public {
        if(msg.sender==sender)
        {
            reciver = _reciver;
        }
    }
}