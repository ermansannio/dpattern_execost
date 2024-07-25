contract Cryptorank {
function withdraw() public{
         
         uint256 reward = selfcommission[msg.sender] + selfharvest[msg.sender] + selfpotprofit[msg.sender];
         
         uint256 subselfharvest = selfharvest[msg.sender];
         
         selfcommission[msg.sender] = 0;
         
         selfharvest[msg.sender] = 0;
         
         selfpotprofit[msg.sender] = 0;
         
         ticketHolderReward[roundid] = ticketHolderReward[roundid].sub(subselfharvest);
         
         awardedReward[roundid] = awardedReward[roundid].add(reward);
         
         msg.sender.transfer(reward);
     }
}