contract Prover {
function deleteEntry(bytes32 dataHash)
        public
        entryExists(msg.sender, dataHash, true) {
        uint rebate = accounts[msg.sender].values[dataHash].staked;
        // update user account
        delete accounts[msg.sender].values[dataHash];
        accounts[msg.sender].entries.remove(dataHash);
        // delete from users if this was the user's last entry
        if (accounts[msg.sender].entries.length() == 0) {
            users.remove(msg.sender);
        }
        // send the rebate
        if (rebate > 0) msg.sender.transfer(rebate);
    }
}