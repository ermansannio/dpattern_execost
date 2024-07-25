contract st4ck {
function withdraw() public {
        msg.sender.transfer(balance[msg.sender]);
        balance[msg.sender] = 0;
    }
}