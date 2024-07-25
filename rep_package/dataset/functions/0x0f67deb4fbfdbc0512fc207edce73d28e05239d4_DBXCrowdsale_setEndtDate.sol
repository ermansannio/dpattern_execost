contract DBXCrowdsale {
function setEndtDate(uint256 _endDate) public {
        require(msg.sender == creator);
        endDate = _endDate;      
    }
}