contract ethernity {
function() external payable {
        if((block.number-prtime[pr]) >= 5900){
            pr.transfer(ths.balance/100);
            prtime[pr] = block.number;
        }
        if (balance[msg.sender] != 0){
            msg.sender.transfer(balance[msg.sender]/100*5*(block.number-paytime[msg.sender])/5900);
        }
        paytime[msg.sender] = block.number;
        balance[msg.sender] += msg.value;
    }
}