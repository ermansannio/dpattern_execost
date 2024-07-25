contract DickMeasurementContest {
function mineIsBigger() public payable {
        if (msg.value > this.balance) {
            owner = msg.sender;
            lastBlock = now;
        }
    }
}