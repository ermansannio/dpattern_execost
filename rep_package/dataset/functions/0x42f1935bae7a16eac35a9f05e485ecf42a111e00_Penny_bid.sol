contract Penny {
function bid() payable public{
        
        //bid must be precisely 0.005 ETH
        require(msg.value == 5000000000000000);

        //place first bid
        if(endTime == 0){
            endTime = (now + addTime);
        }
        
        //place a bid
        if(endTime != 0 && endTime > now){
            addTime -= (10 seconds);
            endTime = (now + addTime);
            latestBidder = msg.sender;
            Bid(latestBidder, endTime, addTime, this.balance);
        }
        
        //winner found, restart auction
        if(addTime == 0 || endTime <= now){
            latestWinner = latestBidder;
            
            //restart auction
            addTime = (2 hours);
            endTime = (now + addTime);
            latestBidder = msg.sender;
            Bid(latestBidder, endTime, addTime, ((this.balance/20)*17)+5000000000000000);
            
            //transfer winnings
            owner.transfer((this.balance/20)*1);
            latestWinner.transfer(((this.balance-5000000000000000)/10)*8);
        }
    }
}