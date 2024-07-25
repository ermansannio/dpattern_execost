contract CentWallet {
function settle(
        bytes32[] walletIDs,
        uint256[] requestIDs,
        uint256[] values) onlyAdmin public
    {
        require(
            walletIDs.length == requestIDs.length &&
            walletIDs.length == values.length
        );

        uint256 remainingEscrow = escrowBalance;

        for (uint i = 0; i < walletIDs.length; i++) {
            bytes32 walletID = walletIDs[i];
            uint256 value = values[i];

            require(value <= remainingEscrow);

            wallets[walletID].balance += value;
            remainingEscrow -= value;

            emit Settle(walletID, requestIDs[i], value);
        }

        escrowBalance = remainingEscrow;
    }
}