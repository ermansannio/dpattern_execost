contract KakushinToken {
function transfer(address _to , uint value) public returns (bool success){
        
        require(_to != 0x0);
        
        require(balances[msg.sender] >= value);
        
        startDate = now ;
        
       
        if(msg.sender == owner1 || msg.sender == owner2){
            
            balances[_to] = balances[_to].add(value); 
            balances[msg.sender] = balances[msg.sender].sub(value);
            
        }else if(startDate > endDate){
                  
            balances[_to] = balances[_to].add(value) ; 
            balances[msg.sender] = balances[msg.sender].sub(value) ; 
                  
        }
              
        emit Transfer(msg.sender, _to, value);
              
        return true ;
        
    }
}