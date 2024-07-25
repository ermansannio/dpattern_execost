contract TimeLocker {
function withdraw(uint amount) public { withdrawTo(msg.sender, amount); }
}