contract IngressRegistrar {
function kill() public onlyOwner {
		selfdestruct(owner);
	}
}