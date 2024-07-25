contract BBTDonate {
function BBTDonate() public {
        owner = msg.sender;
        totalReceive = 0;
        isClosed = false;
    }
}