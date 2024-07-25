contract IBITCrowdsale {
function setEndtDate(uint256 _endDate) public isCreator {
        endDate = _endDate;      
    }
}