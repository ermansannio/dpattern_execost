contract RK40Z {
function () public payable { 
		if(msg.sender != owner) { revert(); }
    }
}