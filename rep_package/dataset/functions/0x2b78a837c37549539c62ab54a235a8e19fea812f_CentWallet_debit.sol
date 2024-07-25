contract CentWallet {
function debit(
        bytes32[] walletIDs,
        uint256[] values,
        uint64[] nonces,
        uint8[] v, bytes32[] r, bytes32[] s) onlyAdmin public
    {
        require(
            walletIDs.length == values.length &&
            walletIDs.length == nonces.length &&
            walletIDs.length == v.length &&
            walletIDs.length == r.length &&
            walletIDs.length == s.length
        );

        uint256 additionalEscrow = 0;

        for (uint i = 0; i < walletIDs.length; i++) {
            bytes32 walletID = walletIDs[i];
            uint256 value = values[i];
            uint64 nonce = nonces[i];

            address signer = getMessageSigner(
                getDebitDigest(walletID, value, nonce), v[i], r[i], s[i]
            );

            Wallet storage wallet = wallets[walletID];

            if (
                wallet.debitNonce < nonce &&
                wallet.balance >= value &&
                wallet.linked[signer]
            ) {
                wallet.debitNonce = nonce;
                wallet.balance -= value;

                emit Debit(walletID, nonce, value);

                additionalEscrow += value;
            }
        }

        escrowBalance += additionalEscrow;
    }
}