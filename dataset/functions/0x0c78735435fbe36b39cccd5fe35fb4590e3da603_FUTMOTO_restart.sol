contract FUTMOTO {
function restart() public {
        require(swap && now >= endTime);
        
        penalty = this.balance * 2000 / 10000;
        
        payFees();
        
        _start();
    }
}