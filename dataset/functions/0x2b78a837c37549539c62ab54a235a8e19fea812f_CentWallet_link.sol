contract CentWallet {
function link(
        bytes32[] walletIDs,
        bytes32[] nameIDs,
        address[] agents,
        uint8[] v, bytes32[] r, bytes32[] s) onlyAdmin public
    {
        require(
            walletIDs.length == nameIDs.length &&
            walletIDs.length == agents.length &&
            walletIDs.length == v.length &&
            walletIDs.length == r.length &&
            walletIDs.length == s.length
        );

        for (uint i = 0; i < walletIDs.length; i++) {
            bytes32 walletID = walletIDs[i];
            address agent = agents[i];

            address signer = getMessageSigner(
                getLinkDigest(walletID, agent), v[i], r[i], s[i]
            );

            Wallet storage wallet = wallets[walletID];

            if (wallet.linked[signer] || walletID == getWalletDigest(nameIDs[i], signer)) {
                wallet.linked[agent] = true;

                emit Link(walletID, agent);
            }
        }
    }
}