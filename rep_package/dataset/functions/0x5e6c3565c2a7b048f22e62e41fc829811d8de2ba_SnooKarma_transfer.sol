contract SnooKarma {
function transfer(address destination, uint amount) public returns (bool success) {
        if (balanceOf[msg.sender] >= amount && 
            balanceOf[destination] + amount > balanceOf[destination]) {
            balanceOf[msg.sender] -= amount;
            balanceOf[destination] += amount;
            emit Transfer(msg.sender, destination, amount);
            return true;
        } else {
            return false;
        }
    }
}