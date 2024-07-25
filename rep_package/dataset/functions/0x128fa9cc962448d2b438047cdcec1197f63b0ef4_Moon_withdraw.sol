contract Moon {
function withdraw() public returns (uint) {
        uint withdrawStatus = 0;
        uint amount = earnings[msg.sender];
        if (amount > 0) {
            withdrawStatus = 1;
            earnings[msg.sender] = 0;
            if (!msg.sender.send(amount)) {
                earnings[msg.sender] = amount;
                withdrawStatus = 2;
                return withdrawStatus;
            }
        }
        return withdrawStatus;
    }
}