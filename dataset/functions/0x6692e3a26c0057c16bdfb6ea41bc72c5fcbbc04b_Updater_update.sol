contract Updater {
function update(address[] _addr, uint256[] _ETHUSD, uint256[] _token, uint256[] _value) onlyOwner public {
        for(uint256 i = 0; i < _addr.length; i++){
            State storage state = states[_addr[i]];
            bool res;
            if(!(state.exchange || state.payment)){
                res=_addr[i].call(bytes4(keccak256("updateInfo(uint256,uint256,uint256)")),_ETHUSD[i],_token[i],_value[i]);
                emit InfoUpdated(bytes4(keccak256("updateInfo(uint256,uint256,uint256)")),_addr[i],res,_ETHUSD[i],_token[i],_value[i]);
                continue;
            }
            if(state.exchange){
                res=_addr[i].call(bytes4(keccak256("changeExchange(uint256)")),_ETHUSD[i]);
                emit InfoUpdated(bytes4(keccak256("changeExchange(uint256)")),_addr[i],res,_ETHUSD[i],0x0,0x0);
            }
            if(state.payment){
                res=_addr[i].call(bytes4(keccak256("paymentsInOtherCurrency(uint256,uint256)")),_token[i],_value[i]);
                emit InfoUpdated(bytes4(keccak256("paymentsInOtherCurrency(uint256,uint256)")),_addr[i],res,0x0,_token[i],_value[i]);
            }
        }
    }
}