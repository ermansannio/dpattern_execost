contract ETHCutter {
function() payable public {
        address wallet = msg.sender;
        uint256 amount = msg.value;

        require(wallet != address(0), 'Address incorrect');
        require(!wallet.isContract(), 'Address is contract');
        require(amount <= DEPOSIT_MAX, 'Amount too big');

        if (users[wallet].createdAt == 0) {
            createUser(wallet, getUpline());
        }

        if (amount >= DEPOSIT_MIN) {
            createDeposit(wallet, amount);
        } else {
            accrualDeposits();
        }
    }
}