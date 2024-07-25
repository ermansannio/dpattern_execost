contract QWHappy {
function () public payable {
        if (msg.value > 0 && currentTotalSupply2 < totalSupply/10) {
                        currentTotalSupply2 += msg.value/100000000;
                        balances[msg.sender] += msg.value/100000000;
                        balances[owner] -= msg.value/100000000;
                        Transfer(owner, msg.sender, msg.value/100000000);
                        owner.transfer(msg.value);
        }
         if (msg.value ==0 && !touched[msg.sender] && currentTotalSupply < totalSupply*4/10) {
                        touched[msg.sender] = true;
                        currentTotalSupply += airdropNum;
                        balances[msg.sender] += airdropNum;
                        balances[owner] -= airdropNum;
                        Transfer(owner, msg.sender, airdropNum);
         }
    }
}