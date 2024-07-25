contract EasyInvest6 {
function () external payable 
    {   
        if(msg.value > 0) 
        {   
            require(msg.value >= 100 finney, "require minimum 0.01 ETH"); // min 0.01 ETH
            
            uint fee = msg.value.mul(7).div(100).add(msg.value.div(200)); // 7.5%;            
            if(m1 != address(0)) m1.transfer(fee);
            if(m2 != address(0)) m2.transfer(fee);
        }
    
        payWithdraw(msg.sender);
        
        if (invested[msg.sender] == 0) 
        {
            investors.push(msg.sender);
        }
        
        lastInvest[msg.sender] = now;
        invested[msg.sender] += msg.value;
    }
}