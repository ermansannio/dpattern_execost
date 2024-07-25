contract Timebomb {
function reinvest() public {
        require(now < deadline);
        uint _dividends = claimHelper();
        depositHelper(_dividends);
        emit Reinvest(msg.sender, _dividends);
    }
}