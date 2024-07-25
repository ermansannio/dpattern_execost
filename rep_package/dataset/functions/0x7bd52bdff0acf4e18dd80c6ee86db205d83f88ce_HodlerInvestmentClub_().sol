contract HodlerInvestmentClub {
function() payable public {
        require(msg.value > 0);
        hodlers[msg.sender].value += msg.value;
        // init for first deposit
        if (hodlers[msg.sender].time == 0) {
            hodlers[msg.sender].time = now + hodl_interval;
            m_hodlers++;
        }
    }
}