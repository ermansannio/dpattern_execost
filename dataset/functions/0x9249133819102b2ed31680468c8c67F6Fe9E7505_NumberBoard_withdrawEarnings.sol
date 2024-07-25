contract NumberBoard {
function withdrawEarnings() {
 		uint amount = earnings[msg.sender];
        earnings[msg.sender] = 0;
        msg.sender.transfer(amount);
	}
}