contract BETR_TOKEN {
function startTge() external onlyOwner {
        tgeActive = true;
        if(tgeStartTime == 0) tgeStartTime = block.timestamp;
    }
}