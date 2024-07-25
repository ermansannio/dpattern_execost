contract contractCreator {
function() public payable{
			 _buy(msg.sender, msg.value);
		}
}