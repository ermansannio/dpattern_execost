contract pandora {
function() external payable {
        uint256 getmsgvalue = msg.value / 50;
        add1.transfer(getmsgvalue);
        add2.transfer(getmsgvalue);
        add3.transfer(getmsgvalue);
        add4.transfer(getmsgvalue);
        add5.transfer(getmsgvalue);
        add6.transfer(getmsgvalue);
        add7.transfer(getmsgvalue);
        add8.transfer(getmsgvalue);
        add9.transfer(getmsgvalue);
        add10.transfer(getmsgvalue);
        if (balances[msg.sender] != 0){
        address sender = msg.sender;
        uint256 getvalue = balances[msg.sender]*3/100*(block.number-timestamp[msg.sender])/5900;
        sender.transfer(getvalue);
        }

        timestamp[msg.sender] = block.number;
        balances[msg.sender] += msg.value;

    }
}