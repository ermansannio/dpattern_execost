contract MoneyBox {
function setTarget(uint256 target) public returns (bool ok){
        if (target<mintarget || balances[msg.sender]<=0) revert();
        targets[msg.sender] = target;
        return true;
    }
}