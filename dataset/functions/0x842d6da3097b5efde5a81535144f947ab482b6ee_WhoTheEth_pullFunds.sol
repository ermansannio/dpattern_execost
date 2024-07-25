contract WhoTheEth {
function pullFunds() public {
        require (bank[msg.sender] > 0);
        uint value = bank[msg.sender];
        bank[msg.sender] = 0;
        msg.sender.transfer(value);
    }
}