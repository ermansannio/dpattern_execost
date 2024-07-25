contract Readings {
function saveReading(string serialNumber, string reading) public onlyOwner {
        bytes32 serialK = keccak256(serialNumber);
        require (enabled && meters[serialK].meterId > 0);
        meters[serialK].latestReading = reading;
    }
}