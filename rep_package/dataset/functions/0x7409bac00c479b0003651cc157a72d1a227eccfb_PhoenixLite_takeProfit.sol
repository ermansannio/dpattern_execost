contract PhoenixLite {
function takeProfit() public {
        Account memory acc = updateProfit(msg.sender);

        if(canceled()) {
            payback();
            return;
        }

        uint money2send = acc.profitTotal - acc.profitTaken;
        acc.profitTaken += money2send;
        accounts[msg.sender] = acc;

        if(money2send > 0) {
            msg.sender.transfer(money2send);
        }
    }
}