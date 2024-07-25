contract ibaMultisig {
function topBalance(address creator, uint id) external payable {
        require (msg.value > 0 wei);
        wallets[creator][id].allowance += msg.value;
        
        /* create new log entry */
        uint loglen = wallets[creator][id].logs.length++;
        wallets[creator][id].logs[loglen].amount = msg.value;
        wallets[creator][id].logs[loglen].sender = msg.sender;
        emit topUpBalance(msg.value);
    }
}