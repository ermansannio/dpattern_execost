contract ibaMultisig {
function confirmTransaction(address creator, uint walletId, uint txId) onlyOwner(creator, walletId) external returns (bool){
        Wallet storage wallet = wallets[creator][walletId];
        Transaction storage txn = wallet.transactions[txId];

        //check whether this owner has already confirmed this txn
        bool f;
        for (uint8 i = 0; i<txn.confirmed.length;i++){
            if (txn.confirmed[i] == msg.sender){
                f = true;
            }
        }
        //push sender address into confirmed array if haven't found
        require(!f);
        txn.confirmed.push(msg.sender);
        
        if (txn.confirmed.length == wallet.appovalsreq){
            txn.status = TxnStatus.Pending;
        }
        
        //fire event
        emit TxnConfirmed(txId);
        
        return true;
    }
}