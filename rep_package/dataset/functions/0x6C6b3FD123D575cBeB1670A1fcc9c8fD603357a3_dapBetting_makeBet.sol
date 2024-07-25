contract dapBetting {
function makeBet(address creator, uint eventId, bytes32 bidName) payable external{
        require(betEvents[creator][eventId].status == eventStatus.open);
        /* check whether bid with given name actually exists */
        bool found;
        for (uint8 i=0;i<betEvents[creator][eventId].bids.length;i++){
            if (betEvents[creator][eventId].bids[i].name == bidName){
                bid storage foundBid = betEvents[creator][eventId].bids[i];
                found = true;
            }
        }
        require(found);
        foundBid.whoBet.push(msg.sender);
        foundBid.amountReceived += msg.value;
        uint newBetId = betEvents[creator][eventId].bets.length++;
        betEvents[creator][eventId].bets[newBetId].person = msg.sender;
        betEvents[creator][eventId].bets[newBetId].amount = msg.value;
        betEvents[creator][eventId].bets[newBetId].bidName = bidName;
        
        emit betMade(msg.value, newBetId);
    }
}