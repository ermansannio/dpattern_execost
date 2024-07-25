contract Cryptorank {
function voting (string _name) 
       payable 
       public 
       isactivity(roundid)
       returns(string)
    {

        //require(raiseethamount == 100);
        
        uint256 currentticketPrice = ticketPrice;
       
        require(msg.value >= currentticketPrice);
        
        string memory ifgetpot = airdrppReward();
        
        require(now > (rounds[roundid].start + nextRoundCoolingTime) &&(now <= rounds[roundid].end ||rounds[roundid].lastvoter == address(0) ));
        
          
          selfvoteamount[msg.sender] = selfvoteamount[msg.sender].add(msg.value);
          
          uint256 votes = msg.value.div(currentticketPrice);
          
          //Divies.deposit.value(msg.value.mul(5).div(100))();
          
          uint256 reward = msg.value.mul(51).div(100);
          
          uint256 _now = now;
        if(_now - SortingCoinstime >2 hours){
            SortingCoins();
            SortingCoinstime = _now;
            emit Sortime(msg.sender,_now);
        }
          
          tovote(_name,votes,reward);
         
          allot(votes);
         
          calculateselfOdd();
          
          ticketPrice = calculatVotePrice();
        
        
      
       return ifgetpot;
   }
}