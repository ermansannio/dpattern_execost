contract dapBetting {
function createEvent(bytes32 name, bytes32[] names, address arbitrator, uint fee) external{
        
        require(fee < 100);
        /* check whether event with such name already exist */
        bool found;
        for (uint8 x = 0;x<betEvents[msg.sender].length;x++){
            if(betEvents[msg.sender][x].name == name){
                found = true;
            }
        }
        require(!found);
        
        /* check names for duplicates */
        for (uint8 y=0;i<names.length;i++){
            require(names[y] != names[y+1]);
        }
        
        uint newId = betEvents[msg.sender].length++;
        betEvents[msg.sender][newId].id = newId;
        betEvents[msg.sender][newId].name = name;
        betEvents[msg.sender][newId].arbitrator = arbitrator;
        betEvents[msg.sender][newId].status = eventStatus.open;
        betEvents[msg.sender][newId].creator = msg.sender;
        betEvents[msg.sender][newId].arbitratorFee = fee;
        
        for (uint8 i = 0;i < names.length; i++){
            uint newBidId = betEvents[msg.sender][newId].bids.length++;
            betEvents[msg.sender][newId].bids[newBidId].name = names[i];
            betEvents[msg.sender][newId].bids[newBidId].id = newBidId;
        }
        
        emit EventCreated(newId, msg.sender);
    }
}