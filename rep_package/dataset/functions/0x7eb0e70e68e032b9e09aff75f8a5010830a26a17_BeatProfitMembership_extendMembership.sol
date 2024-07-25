contract BeatProfitMembership {
function extendMembership(uint256 _type) public payable{
    // Type:[0]:hour, [1]:day, [2]:month, [3]:year, [4]:premium
    
        require(msg.value >= priceOfPeriod[_type], "Payment Amount Wrong.");
        if(_type==4){
            // Premium Membership
            Premium[msg.sender] = true;
            DueTime[msg.sender] = 4689878400;
        }
        else if(DueTime[msg.sender]>now){
            DueTime[msg.sender] += mul(div(msg.value, priceOfPeriod[_type]), TimeInSec[_type]);
        }
        else{
            DueTime[msg.sender] = now + mul(div(msg.value, priceOfPeriod[_type]), TimeInSec[_type]);
        }
        
        owner.transfer(msg.value);
    }
}