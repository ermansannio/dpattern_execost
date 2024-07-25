contract IBITCrowdsale {
function setStartDate(uint256 _startDate) public isCreator {
        startDate = _startDate;      
    }
}