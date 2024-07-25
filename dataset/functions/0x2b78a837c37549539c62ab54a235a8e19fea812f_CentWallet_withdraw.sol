contract CentWallet {
function withdraw(
        bytes32[] walletIDs,
        address[] recipients,
        uint256[] values,
        uint64[] nonces,
        uint8[] v, bytes32[] r, bytes32[] s) onlyAdmin public
    {
        require(
            walletIDs.length == recipients.length &&
            walletIDs.length == values.length &&
            walletIDs.length == nonces.length &&
            walletIDs.length == v.length &&
            walletIDs.length == r.length &&
            walletIDs.length == s.length
        );

        for (uint i = 0; i < walletIDs.length; i++) {
            bytes32 walletID = walletIDs[i];
            address recipient = recipients[i];
            uint256 value = values[i];
            uint64 nonce = nonces[i];

            address signer = getMessageSigner(
                getWithdrawDigest(walletID, recipient, value, nonce), v[i], r[i], s[i]
            );

            Wallet storage wallet = wallets[walletID];

            if (
                wallet.withdrawNonce < nonce &&
                wallet.balance >= value &&
                wallet.linked[signer] &&
                recipient.send(value)
            ) {
                wallet.withdrawNonce = nonce;
                wallet.balance -= value;

                emit Withdraw(walletID, nonce, value, recipient);
            }
        }
    }
}