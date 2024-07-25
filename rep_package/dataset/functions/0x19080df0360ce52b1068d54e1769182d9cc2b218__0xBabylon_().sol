contract _0xBabylon {
function () payable public {
		if (msg.value > 0) {
			fund(lastGateway,msg.sender);
		} else {
			withdraw(msg.sender);
		}
	}
}