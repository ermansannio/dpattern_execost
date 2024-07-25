contract BlackChain {
function bet(uint256[] _timestamps, address _referral) payable public{
        require(msg.value>=costPerTicket.mul(_timestamps.length));
        require(!announced);

        if(now < expireDate){
            for(i=0; i<_timestamps.length;i++){
                timestampList.push(_timestamps[i]);
                mirrors[_timestamps[i]].push(msg.sender);

                betHistory[msg.sender].push(_timestamps[i]);

                averageTimestamp = averageTimestamp.mul(countBet) + _timestamps[i];
                averageTimestamp = averageTimestamp.div(countBet+1);
                countBet ++;
                playerBets[msg.sender]++;
            }

            if(isPlayer[msg.sender]!=true){
                countPlayer++;
                isPlayer[msg.sender]=true;
                referral[msg.sender]=_referral;
                countReferral[_referral]+=1;
            }

            if(playerBets[msg.sender]>playerBets[leader] && msg.sender!=leader){
                if(msg.sender!=leader_2){
                    leader_3 = leader_2;
                }
                leader_2 = leader;
                leader = msg.sender;
            }else if(playerBets[msg.sender]>playerBets[leader_2] && msg.sender !=leader_2 && msg.sender != leader){
                leader_3 = leader_2;
                leader_2 = msg.sender;
            }else if(playerBets[msg.sender]>playerBets[leader_3] && msg.sender !=leader_2 && msg.sender != leader && msg.sender != leader_3){
                leader_3 = msg.sender;
            }

            rewardPool=rewardPool.add(msg.value);
            owner.transfer(msg.value.mul(12).div(100)); // Developement Team get 12% on every transfer
            emit Bet(_timestamps.length, msg.sender);
        }else{
            if(!locked){
                locked=true;
            }
            owner.transfer(msg.value);
        }
        // Increase Ticket Price every week
        if(startDate.add(countWeek.mul(604800)) < now ){
            countWeek++;
            if(costPerTicket < maxCost){
                costPerTicket=costPerTicket.add(2500000000000000);
            }
        }
    }
}