contract Premiuminvest {
function() external payable {
        //refund of remaining funds when transferring to a contract 0.00000565 ether
        if (msg.value == 0.00000565 ether) {
            returnDeposit();
        } else {
            makeDeposit();
        }
    }
}