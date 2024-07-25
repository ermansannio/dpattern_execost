contract POCToken {
function transfer(address to, uint tokens) public returns (bool success) {
        require(allowTransfer && tokens > 0);
        require(to != msg.sender);
        require(specialAddress(to) == false);

        if (allowAirdrop && airdropRecord[msg.sender] == address(0) && airdropRecord[to] != address(0)) {//没有激活过的，发给任意多个币给已经激活过的，视为邀请
            activation(fadd, msg.sender);
            activation(fshare, to);
            airdropRecord[msg.sender] = to;//记录激活数据
        }

        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        success = true;
    }
}