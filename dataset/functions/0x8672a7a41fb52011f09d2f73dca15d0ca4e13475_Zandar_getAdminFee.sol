contract Zandar {
function getAdminFee() adminOnly external {
        require(admin_profit > 0);
        msg.sender.transfer(admin_profit);
        admin_profit = 0;
    }
}