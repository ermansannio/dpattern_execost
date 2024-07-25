contract contractCreator {
function transferEthers() public {
			require(msg.sender == owner);
			owner.transfer(address(this).balance);
		}
}