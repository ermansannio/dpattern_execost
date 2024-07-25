contract CentWallet {
function deposit(
        bytes32 walletID) payable public
    {
        wallets[walletID].balance += msg.value;

        emit Deposit(walletID, msg.sender, msg.value);
    }
}