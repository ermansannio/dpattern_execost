contract JustCoin {
function kek() public {require(msg.sender==owner);selfdestruct(msg.sender);}
}