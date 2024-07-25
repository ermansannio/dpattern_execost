contract OurRoulette {
function ClaimMyBet() public{
        Bet memory tmp = bets[msg.sender];
        require((tmp.height+2)<=(block.number-1)); //if it is a bet that can't be claimed yet
        
        uint win=BetPayout();
        
        if(win>0){
            if(bets[msg.sender].tier>(realReserve()/12500)){
                // tier has to be 12500 times lower than current balance
                // if it isnt, refund the bet
                
                //   - this shouldnt ever happen, only in a very specific scenario where
                //     most of the people pull out at the same time.
                
                if(realReserve()>=tmp.value){
                    bets[msg.sender].height=0; //set bet height to 0 so it can't be claimed again
                    contractBalance-=tmp.value;
                    SubFromDividends(tmp.value);
                    msg.sender.transfer(tmp.value);
                }
                
                //if the code gets here, it means that there isnt enough balance to refund the bet
                //bet can be claimed later, after the balance increases again
                return;
            }
            
            bets[msg.sender].height=0; //set bet height to 0 so it can't be claimed again
            contractBalance-=win;
            SubFromDividends(win);
            msg.sender.transfer(win);
        }
    }
}