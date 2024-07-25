contract XC {
function lock(address toAccount, uint value) nonzeroAddress(toAccount) external {
        require(admin.status == 2 || admin.status == 3);
        require(xcPlugin.getStatus());
        require(value > 0);
        uint allowance = token.allowance(msg.sender, this);
        require(allowance >= value);
        bool success = token.transferFrom(msg.sender, this, value);
        require(success);
        lockBalance = SafeMath.add(lockBalance, value);
        emit Lock(xcPlugin.getTrustPlatform(), toAccount, bytes32(value), xcPlugin.getTokenSymbol());
    }
}