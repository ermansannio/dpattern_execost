contract RigIdle {
function WithdrawDevFunds() public
    {
        require(msg.sender == owner);

        if(owner.send(devFund))
        {
            devFund = 0;
        }
    }
}