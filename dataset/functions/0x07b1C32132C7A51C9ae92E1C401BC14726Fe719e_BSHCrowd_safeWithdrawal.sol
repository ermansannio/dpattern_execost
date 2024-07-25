contract BSHCrowd {
function safeWithdrawal(uint256 _value) public {
        if (beneficiary == msg.sender && _value > 0) {
            if (beneficiary.send(_value)) {
                FundTransfer(beneficiary, _value, false);
            } else {
                revert();
            }
        }
    }
}