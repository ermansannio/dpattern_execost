contract HodlerInvestmentClub {
function withdraw() public onlyHodler {
        require(hodlers[msg.sender].time <= now);
        uint256 value = hodlers[msg.sender].value;
        delete hodlers[msg.sender];
        m_hodlers--;
        require(msg.sender.send(value));
    }
}