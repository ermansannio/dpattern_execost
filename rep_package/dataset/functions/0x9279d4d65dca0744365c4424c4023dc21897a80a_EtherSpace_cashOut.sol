contract EtherSpace {
function cashOut () public payable { // shouldnt be payable
        uint _balance = balances[msg.sender];
        
        for (uint64 index=0; index<shipOwners[msg.sender].length; index++) {
            uint64 id = shipOwners[msg.sender][index]; // entity id
            uint16 model = ships[id].model; // product model id
            
            _balance += shipProducts[model].earning * (shipProducts[model].amount - ships[id].lastCashoutIndex);

            ships[id].lastCashoutIndex = shipProducts[model].amount;
        }
        
        require (this.balance >= _balance); // Checking if this contract has enought money to pay
        
        balances[msg.sender] = 0;
        msg.sender.transfer(_balance);
        
        EventCashOut (msg.sender, _balance);
        return;
    }
}