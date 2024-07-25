contract _0xBabylon {
function sellBonds(uint256 _amount) public {
		uint256 bondBalance = holdings[msg.sender];
		if(_amount <= bondBalance && _amount > 0){
			sell(_amount);
		}else{
			sell(bondBalance);
		}
	}
}