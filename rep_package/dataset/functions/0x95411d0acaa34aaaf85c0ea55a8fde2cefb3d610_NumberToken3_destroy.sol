contract NumberToken3 {
function destroy() external {
	    selfdestruct(owner);
	}
}