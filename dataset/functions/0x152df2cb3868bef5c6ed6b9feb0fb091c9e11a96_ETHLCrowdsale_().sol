contract ETHLCrowdsale {
function () payable public {
        require(msg.value > 0);
        uint256 amount;
        
        // stage 1
        if (now > 1525129200 && now < 1525734000 && tokenSold < 350001) {
            amount = msg.value * 2500;
        }

        // stage 2
        if (now > 1525733999 && now < 1526252400 && tokenSold > 350000 && tokenSold < 700001) {
            amount = msg.value * 1250;
        }

        // stage 3
        if (now > 1526252399 && now < 1526857200 && tokenSold > 700000 && tokenSold < 1150001) {
            amount = msg.value * 833;
        }

        // stage 4
        if (now > 1526857199 && now < 1527721200 && tokenSold > 1150000 && tokenSold < 2000001) {
            amount = msg.value * 416;
        }

        // stage 5
        if (now > 1527721199 && now < 1528671600 && tokenSold > 2000000 && tokenSold < 3000001) {
            amount = msg.value * 357;
        }

        // stage 6
        if (now > 1528671599 && now < 1530399600 && tokenSold > 3000000 && tokenSold < 4000001) {
            amount = msg.value * 333;
        }

        tokenSold += amount / 1 ether;
        tokenReward.transfer(msg.sender, amount);
        FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}