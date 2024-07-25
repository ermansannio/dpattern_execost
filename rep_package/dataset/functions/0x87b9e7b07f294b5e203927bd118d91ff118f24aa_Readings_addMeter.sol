contract Readings {
function addMeter(uint32 meterId, string serialNumber, string meterType) public onlyOwner {
        require(enabled && meterId > 0);
        meters[keccak256(serialNumber)] = 
            MeterInfo({meterId: meterId, serialNumber:serialNumber, meterType:meterType, latestReading:""});
    }
}