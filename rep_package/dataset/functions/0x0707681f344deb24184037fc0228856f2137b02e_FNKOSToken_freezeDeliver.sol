contract FNKOSToken {
function  freezeDeliver(address _to, uint _amount, uint _freezeAmount, uint _freezeMonth, uint _unfreezeBeginTime ) onlyOwner public {
        require(owner != _to);
        require(_freezeMonth > 0);
        
        uint average = _freezeAmount / _freezeMonth;
        BalanceInfo storage bi = balances[_to];
        uint[] memory fa = new uint[](_freezeMonth);
        uint[] memory rt = new uint[](_freezeMonth);

        if(_amount < fnkSupply){
            _amount = _amount * fnkEthRate;
            average = average * fnkEthRate;
            _freezeAmount = _freezeAmount * fnkEthRate;
        }
        require(balances[owner].balance > _amount);
        uint remainAmount = _freezeAmount;
        
        if(_unfreezeBeginTime == 0)
            _unfreezeBeginTime = now + freezeDuration;
        for(uint i=0;i<_freezeMonth-1;i++){
            fa[i] = average;
            rt[i] = _unfreezeBeginTime;
            _unfreezeBeginTime += freezeDuration;
            remainAmount = safeSub(remainAmount, average);
        }
        fa[i] = remainAmount;
        rt[i] = _unfreezeBeginTime;
        
        bi.balance = safeAdd(bi.balance, _amount);
        bi.freezeAmount = fa;
        bi.releaseTime = rt;
        balances[owner].balance = safeSub(balances[owner].balance, _amount);
        emit Transfer(owner, _to, _amount);
        emit Freeze(_to, _freezeAmount);
    }
}