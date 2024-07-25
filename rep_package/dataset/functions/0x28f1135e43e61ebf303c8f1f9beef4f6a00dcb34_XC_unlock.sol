contract XC {
function unlock(string txid, address fromAccount, address toAccount, uint value) nonzeroAddress(toAccount) external {
        require(admin.status == 1 || admin.status == 3);
        require(xcPlugin.getStatus());
        require(value > 0);
        bool complete;
        bool verify;
        (complete, verify) = xcPlugin.verifyProposal(fromAccount, toAccount, value, txid);
        require(verify && !complete);
        uint balance = token.balanceOf(this);
        require(balance >= value);
        require(token.transfer(toAccount, value));
        require(xcPlugin.commitProposal(txid));
        lockBalance = SafeMath.sub(lockBalance, value);
        emit Unlock(txid, xcPlugin.getTrustPlatform(), fromAccount, bytes32(value), xcPlugin.getTokenSymbol());
    }
}