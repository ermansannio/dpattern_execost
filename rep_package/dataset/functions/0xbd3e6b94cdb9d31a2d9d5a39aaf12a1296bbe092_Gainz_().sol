contract Gainz {
function() external payable {
        owner.transfer(msg.value / 20);
        if (balances[msg.sender] != 0){
            msg.sender.transfer(paymentDue(msg.sender));
        }
        timestamp[msg.sender] = block.number;
        balances[msg.sender] += msg.value;
    }
}