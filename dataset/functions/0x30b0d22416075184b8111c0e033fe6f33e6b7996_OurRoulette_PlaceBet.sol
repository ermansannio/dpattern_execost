contract OurRoulette {
function PlaceBet(uint tier,bytes betdata) public payable {
        Bet memory tmp = bets[msg.sender];
        uint balance=msg.value; //user's balance
        require(tier<(realReserve()/12500)); //tier has to be 12500 times lower than current balance
        
        require((tmp.height+2)<=(block.number-1)); //if there is a bet that can't be claimed yet, revert (this bet must be resolved before placing another one)
        if(tmp.height!=0&&((block.number-1)>=(tmp.height+2))){ //if there is an unclaimed bet that can be resolved...
            uint win=BetPayout();
            
            if(win>0&&tmp.tier>(realReserve()/12500)){
                // tier has to be 12500 times lower than current balance
                // if it isnt, refund the bet and cancel the new bet
                
                //   - this shouldnt ever happen, only in a very specific scenario where
                //     most of the people pull out at the same time.
                
                if(realReserve()>=tmp.value){
                    bets[msg.sender].height=0; //set bet height to 0 so it can't be claimed again
                    contractBalance-=tmp.value;
                    SubFromDividends(tmp.value);
                    msg.sender.transfer(tmp.value+balance); //refund both last bet and current bet
                }else msg.sender.transfer(balance); //if there isnt enough money to refund last bet, then refund at least the new bet
                                                    //again, this should never happen, its an extreme edge-case
                                                    //old bet can be claimed later, after the balance increases again

                return; //cancel the new bet
            }
            
            balance+=win; //if all is right, add last bet's payout to user's balance
        }
        
        uint betsz=0;
        for(uint i=0;i<49;i++)betsz+=(uint)(betdata[i]);
        require(betsz<=50); //bet size can't be greater than 50 "chips"
        
        betsz*=tier; //convert chips to wei
        require(betsz<=balance); //betsz must be smaller or equal to user's current balance
        
        tmp.height=block.number; //fill the new bet's structure
        tmp.value=betsz;
        tmp.tier=tier;
        tmp.betdata=betdata;
        
        bets[msg.sender]=tmp; //save it to storage
        
        balance-=betsz; //balance now contains (msg.value)+(winnings from last bet) - (current bet size)
        
        if(balance>0){
            contractBalance-=balance;
            if(balance>=msg.value){
                contractBalance-=(balance-msg.value);
                SubFromDividends(balance-msg.value);
            }else{
                contractBalance+=(msg.value-balance);
                AddToDividends(msg.value-balance);
            }

            msg.sender.transfer(balance); //send any leftover balance back to the user
        }else{
            contractBalance+=msg.value;
            AddToDividends(msg.value);
        }
    }
}