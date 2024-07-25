contract Hours25 {
function () external payable {
        require(msg.value > 0,"Zero. Access denied.");
        total_funds +=msg.value;
        address investor = msg.sender;
        commission.transfer(msg.value * 1 / 100);
        advertising.transfer(msg.value * 1 / 100);

        uint256 profit = calcProfit(investor);
        investor.transfer(profit);

        if (isLastWithdraw(investor)){
          
            balances[investor] = 0;
            receive_funds[investor] = 0;
           
        }
        else {
        receive_funds[investor] += profit;
        balances[investor] += msg.value;
            
        }
        time_stamp[investor] = now;
    }
}