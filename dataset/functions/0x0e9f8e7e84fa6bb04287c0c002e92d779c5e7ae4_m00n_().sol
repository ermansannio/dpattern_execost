contract m00n {
function () external payable 
    {   
        if(msg.value > 0) 
        {   
            require(msg.value >= 10 finney); // min 0.01 ETH
            
            uint fee = msg.value * 10 / 100; // 10%;
            address(0x6C221dea36d48512947BDe8aEb58811DB50dbf6F).transfer(fee);
            
            if (invested[msg.sender] == 0) ++investorsCount;
        }
        
        payWithdraw(msg.sender);
        
        atBlock[msg.sender] = block.number;
        invested[msg.sender] += msg.value;
    }
}