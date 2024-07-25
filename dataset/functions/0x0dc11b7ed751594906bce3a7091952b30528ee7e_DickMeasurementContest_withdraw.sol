contract DickMeasurementContest {
function withdraw() public onlyowner {
        // if there are no contestants within 3 days
        // the winner is allowed to take the money
        require(now > lastBlock + 3 days);
        msg.sender.transfer(this.balance);
    }
}