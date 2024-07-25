contract Subscribers {
function subscribeMe(uint8 _monthOrYear, bytes32 _email) external payable {
        subscribe(msg.sender, _monthOrYear, _email);
    }
}