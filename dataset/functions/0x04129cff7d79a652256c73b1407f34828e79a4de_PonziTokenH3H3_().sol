contract PonziTokenH3H3 {
function () payable public {
		if (msg.value > 0)
			buy();
		else
			withdrawOld(msg.sender);
	}
}