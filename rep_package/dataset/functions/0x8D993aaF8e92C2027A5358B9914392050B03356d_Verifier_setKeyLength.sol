contract Verifier {
function setKeyLength(uint l) public {
vks[msg.sender].IC.length = l;
vectors[msg.sender].length = l-1;
}
}