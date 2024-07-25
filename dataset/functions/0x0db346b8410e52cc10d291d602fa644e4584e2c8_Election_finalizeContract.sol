contract Election {
function finalizeContract(uint256 winningNumber) public mManagerOnly {
        voteResult = winningNumber;
        address[] memory list = users[winningNumber];
        address[] memory secondaryList;
        uint256 winnersCount = list.length;

        if(winnersCount == 0){
            // if there is no winner choose closest estimates.
            bool loop = true;
            uint256 index = 1;
            while(loop == true){
                list = users[winningNumber-index];
                secondaryList = users[winningNumber+index];
                winnersCount = list.length + secondaryList.length;

                if(winnersCount > 0){
                    loop = false;
                }
                else{
                    index++;
                }
            }
        }
        
        uint256 managerFee = (this.balance/100)*5; // manager fee %5
        uint256 reward = (this.balance - managerFee) / winnersCount; // reward for per winner.
        winnerPrice = reward;
        
        // set winner list
        winners = list;
        // transfer eth to winners.
        for (uint256 i = 0; i < list.length; i++) {
            list[i].transfer(reward);
        }
                
        // if anyone guessed the correct percent secondaryList will be empty array.
        for (uint256 j = 0; j < secondaryList.length; j++) {
            // transfer eth to winners.
            secondaryList[j].transfer(reward);
            winners.push(secondaryList[j]); // add to winners
        }
        
        // transfer fee to manager
        manager.transfer(this.balance);
        
        
    }
}