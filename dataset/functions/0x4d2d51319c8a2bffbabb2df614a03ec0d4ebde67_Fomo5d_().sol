contract Fomo5d {
function () public payable{
		if(!contractStart){
			revert();
		}
        if(frozenAccount[msg.sender]){
            revert();
        }
		amount = uint256(msg.value * rate);
		
		if(balanceOf[msg.sender]+amount<balanceOf[msg.sender]){
			revert();
		}
		if(balanceOf[owner]<amount){
			revert();
		}
		//if(amount>0){
			if(exchangeStart){
				balanceOf[owner] -=amount ;
				balanceOf[msg.sender] +=amount;
				Transfer(owner, msg.sender, amount); //token event
			}
			if(!fundOnContract){
				owner.transfer(msg.value);
			}
		//}
    }
}