contract Rain {
function buy() payable {
        uint amount = msg.value / buyPrice;
        if (balanceOf[this] < amount) revert();
        balanceOf[msg.sender] += amount;
        balanceOf[this] -= amount;
        Transfer(this, msg.sender, amount);
    }
}