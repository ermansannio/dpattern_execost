contract UnstoppablePyramid {
function newPonziFriend(uint _parentId) public payable isHuman() {
        /* Commissions */
        uint256 com1percent = msg.value / 100;
        uint256 comLevel1 = com1percent * 50; // 50%
        uint256 comLevel2 = com1percent * 35; // 35%
        uint256 comLevel3 = com1percent * 15; // 15%
    
        require(msg.value >= basePricePonzi);

        /* Transfer commission to parents (level 1, 2 & 3) */

        // Transfer to level 1 if parent[l1] hasn't reached its limit
        if(ponziFriends[_parentId].amountEarned < (ponziFriends[_parentId].amountPlayed * 5) && _parentId < ponziFriends.length) {
            // Transfer commission
            ponziFriends[_parentId].playerAddr.transfer(comLevel1);

            // Record amount received
            ponziFriends[_parentId].amountEarned += comLevel1;
            
            // Increment level 1 ref
            ponziFriendToLevel1Ref[_parentId]++;
        } else {
            // If the parent has exceeded its x5 limit we transfer the commission to the dev
            devAddress.transfer(comLevel1);
        }
        

        // Transfer to level 2
        uint level2parent = ponziFriends[_parentId].parent;
        if(ponziFriends[level2parent].amountEarned < (ponziFriends[level2parent].amountPlayed *5 )) {
            // Transfer commission
            ponziFriends[level2parent].playerAddr.transfer(comLevel2);

            // Record amount received
            ponziFriends[level2parent].amountEarned += comLevel2;
            
            // Increment level 2 ref
            ponziFriendToLevel2Ref[level2parent]++;
        } else {
            // If the parent has exceeded its x5 limit we transfer the commission to the dev
            devAddress.transfer(comLevel2);
        }
        

        // Transfer to level 3
        uint level3parent = ponziFriends[level2parent].parent;
        if(ponziFriends[level3parent].amountEarned < (ponziFriends[level3parent].amountPlayed * 5)) {
            // Transfer commission
            ponziFriends[level3parent].playerAddr.transfer(comLevel3); 

            // Record amount received
            ponziFriends[level3parent].amountEarned += comLevel3;
            
            // Increment level 3 ref
            ponziFriendToLevel3Ref[level3parent]++;
        } else {
            // If the parent has exceeded its x5 limit we transfer the commission to the dev
            devAddress.transfer(comLevel3);
        }

        /* End Transfer */

        /* Save Ponzi Friend in struct */

        if(ponziFriendsToId[msg.sender] > 0) {
            // Player exists, update data
            ponziFriends[ponziFriendsToId[msg.sender]].amountPlayed += msg.value;
        } else {
            // Player doesn't exist create it
            uint pzfId = ponziFriends.push(PonziFriend(msg.sender, _parentId, msg.value, 0)) - 1;
            ponziFriendsToId[msg.sender] = pzfId;
        }

        /* End Save Ponzi Friend */

        /* Save stats */
        totalAmountPlayed = totalAmountPlayed + msg.value;
        totalCommissionSent = totalCommissionSent + comLevel1 + comLevel2 + comLevel3;

    }
}