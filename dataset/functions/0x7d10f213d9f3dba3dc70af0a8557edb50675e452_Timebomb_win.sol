contract Timebomb {
function win() public {
        require(now >= deadline);
        require(msg.sender == leader);
        require(!prizeClaimed);
        uint _amount = totalInvestment;
        uint _tax = _amount.div(withdrawalTaxDivisor);
        uint _amountAfterTax = _amount.sub(_tax);
        if (totalStake > 0)
            stakeValue = stakeValue.add(_tax.div(totalStake));
        prizeClaimed = true;
        msg.sender.transfer(_amountAfterTax);
        emit Win(msg.sender, _amount);
    }
}