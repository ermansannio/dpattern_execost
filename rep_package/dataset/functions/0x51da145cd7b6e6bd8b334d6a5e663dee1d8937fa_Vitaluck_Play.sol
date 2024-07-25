contract Vitaluck {
function Play() public payable {
        // We don't run the function if the player paid less than 0.01 ETH
        require(msg.value >= minBetValue);
        
        // If this is the first ticket ever
        if(totalTickets == 0) {
            // We save the current Jackpot value
            totalTickets++;
            currentJackpot = currentJackpot + msg.value;
            return;
        }

        uint _thisJackpot = currentJackpot;
        // here we count the number of tickets purchased by the user (each ticket costs 0.01ETH)
        uint _finalRandomNumber = 0;
        
        // We save the current Jackpot value
        currentJackpot = currentJackpot + msg.value;
        
        // We generate a random number for each ticket purchased by the player
        // Example: 1 ticket costs 0.01 ETH, if a user paid 1 ETH, we will run this function 100 times and save the biggest number of all as its result
        _finalRandomNumber = (uint(now) - 1 * randomNumber * randomNumber2 + uint(now))%1000 + 1;
        randomNumber = _finalRandomNumber;

        // We keep track of the amount played by the users
        amountPlayed = amountPlayed + msg.value;
        totalTickets++;
        ownerBetsCount[msg.sender]++;

        // We calculate and transfer to the owner a commission of 10%
        uint256 MsgValue10Percent = msg.value / 10;
        cfoAddress.transfer(MsgValue10Percent);
        
        
        // We save the current Jackpot value
        currentJackpot = currentJackpot - MsgValue10Percent;

        // Now that we have the biggest number of the player we check if this is better than the previous winning number
        if(_finalRandomNumber > currentWinningNumber) {
            
            // we update the cooldown time (when the cooldown time is expired, the owner will be able to reset the game)
            currentResetTimer = now + cooldownTime;

            // The player is a winner and wins the jackpot (he/she wins 90% of the balance, we keep some funds for the next game)
            uint256 JackpotWon = _thisJackpot;
            
            msg.sender.transfer(JackpotWon);
            
            // We save the current Jackpot value
            currentJackpot = currentJackpot - JackpotWon;
        
            // We keep track of the amount won by the users
            amountWon = amountWon + JackpotWon;
            currentWinningNumber = _finalRandomNumber;
            currentWinningAddress = msg.sender;

            // We save this bet in the blockchain
            bets.push(Bet(_finalRandomNumber, true, msg.sender, uint32(now), JackpotWon));
            NewPlay(msg.sender, _finalRandomNumber, true);
            
            // If the user's number is equal to 100 we reset the max number
            if(_finalRandomNumber >= 900) {
                // We reset the winning address and set the current winning number to 1 (the next player will have 99% of chances to win)
                currentWinningAddress = address(this);
                currentWinningNumber = 1;
            }
        } else {
            // The player is a loser, we transfer 10% of the bet to the current winner and save the rest in the jackpot
            currentWinningAddress.transfer(MsgValue10Percent);
        
            // We save the current Jackpot value
            currentJackpot = currentJackpot - MsgValue10Percent;
        
            // We save this bet in the blockchain
            bets.push(Bet(_finalRandomNumber, false, msg.sender, uint32(now), 0));
            NewPlay(msg.sender, _finalRandomNumber, false);
        }
    }
}