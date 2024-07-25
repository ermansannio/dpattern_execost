contract NumberBoard {
function withdrawDeadBids() {
 		uint amount = deadbids[msg.sender];
        deadbids[msg.sender] = 0;
        msg.sender.transfer(amount);
	}
}