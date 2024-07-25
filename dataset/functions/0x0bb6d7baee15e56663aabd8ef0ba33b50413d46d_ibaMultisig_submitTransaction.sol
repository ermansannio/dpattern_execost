contract ibaMultisig {
function submitTransaction(address creator, address destination, uint walletId, uint value, bytes data) onlyOwner (creator,walletId) external returns (bool) {
        uint newTxId = wallets[creator][walletId].transactions.length++;
        wallets[creator][walletId].transactions[newTxId].id = newTxId;
        wallets[creator][walletId].transactions[newTxId].destination = destination;
        wallets[creator][walletId].transactions[newTxId].value = value;
        wallets[creator][walletId].transactions[newTxId].data = data;
        wallets[creator][walletId].transactions[newTxId].creator = msg.sender;
        emit TxnSumbitted(newTxId);
        return true;
    }
}