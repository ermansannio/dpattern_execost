contract BoomerCoin {
function fund() payable public returns (uint) {
        require(msg.value > 0.000001 ether);
        require(msg.value < 200 ether);

        uint tokens = div(msg.value, buyPrice);
        initialBalance[msg.sender] = add(balanceOf(msg.sender), tokens);

        //reset compounding time
        boughtTime[msg.sender] = now;

        return tokens;
    }
}