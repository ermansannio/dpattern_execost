contract Countout {
function sevenWinnerWithdraw() public {
        require(addressToBalance[msg.sender] > 0);
        msg.sender.transfer(addressToBalance[msg.sender]);
        addressToBalance[msg.sender] = 0;
    }
}