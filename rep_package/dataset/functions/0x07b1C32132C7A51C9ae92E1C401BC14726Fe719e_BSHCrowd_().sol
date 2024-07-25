contract BSHCrowd {
function () payable public {
        //判断是否关闭众筹
        require(!crowdsaleClosed);
        uint amount = msg.value;

        //众筹人余额累加
        balance[msg.sender] += amount;

        //众筹总额累加
        amountRaised += amount;

        ReceiveFund(msg.sender, amount);
    }
}