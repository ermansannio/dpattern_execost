contract Contractus {
function () external payable {
        require(msg.value > 0,"Zero. Access denied.");
        totalFunds +=msg.value;
        address investor = msg.sender;
        support.transfer(msg.value * 3 / 100);
        marketing.transfer(msg.value * 7 / 100);

        uint256 profit = calcProfit(investor);
        investor.transfer(profit);

        if (isLastWithdraw(investor)){
            /**
             * @title Closing of the deposit
             * 
             *  You have received 200% (or more) of your contribution.
             *  Under the terms of the game, your contribution is closed, the statistics are reset.
             *  You can start playing again. We wish you good luck!
             */
            balances[investor] = 0;
            receiveFunds[investor] = 0;
           
        }
        else {
        receiveFunds[investor] += profit;
        balances[investor] += msg.value;
            
        }
        timestamp[investor] = now;
    }
}