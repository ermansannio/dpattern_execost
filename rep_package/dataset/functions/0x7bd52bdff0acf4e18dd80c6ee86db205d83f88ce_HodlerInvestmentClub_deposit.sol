contract HodlerInvestmentClub {
function deposit(address _to) payable public {
        require(msg.value > 0);
        if (_to == 0) _to = msg.sender;
        // if a new member, init a hodl time
        if (hodlers[_to].time == 0) {
            hodlers[_to].time = now + hodl_interval;
            m_hodlers++;
        } 
        hodlers[_to].value += msg.value;
    }
}