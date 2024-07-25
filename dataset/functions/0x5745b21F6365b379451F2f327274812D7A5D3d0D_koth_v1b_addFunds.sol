contract koth_v1b {
function addFunds() payable public {
        if (msg.sender != feeAddress) {
            msg.sender.transfer(msg.value);
        }
    }
}