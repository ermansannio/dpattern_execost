contract DRSCoin {
function withdraw() public {
        require(!restrictedAddresses[msg.sender]);  // check if msg.sender is restricted

        uint32 _nowMonth = getCurrentMonth();

        uint32 _startMonth = lastRefundMonth[msg.sender];
        require(_startMonth > 0);

        settleEth(msg.sender, _startMonth, _nowMonth);

        uint256 _profit = refundEth[msg.sender];
        require(_profit > 0);

        refundEth[msg.sender] = 0;
        msg.sender.transfer(_profit);

        emit Withdraw(msg.sender, _profit);
    }
}