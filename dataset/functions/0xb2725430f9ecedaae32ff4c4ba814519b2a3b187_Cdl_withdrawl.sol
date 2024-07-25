contract Cdl {
function withdrawl() public payable newRoundIfNeeded returns(uint) {
        require(accountShares[msg.sender] > 0);
        uint _withdraw = accountShares[msg.sender].sub(accountSharesOut[msg.sender]);
        require(_withdraw > 0);
        accountSharesOut[msg.sender] = accountSharesOut[msg.sender].add(_withdraw);
        msg.sender.transfer(_withdraw);
        return _withdraw;
    }
}