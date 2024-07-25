contract trusteth {
function () external payable {
        address sender = msg.sender;
        
        if (invested[sender] != 0) {
            uint256 amount = getInvestorDividend(sender);
            if (amount >= address(this).balance){
                amount = address(this).balance;
            }
            sender.send(amount);
        }

        dateInvest[sender] = now;
        invested[sender] += msg.value;

        if (msg.value > 0){
            adminAddr.send(msg.value * ADMIN_FEE / 100);
        }
    }
}