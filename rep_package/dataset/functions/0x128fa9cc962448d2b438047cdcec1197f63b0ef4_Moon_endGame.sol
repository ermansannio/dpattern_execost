contract Moon {
function endGame() public {
        // uncomment in production
        require(now > gameEnd);
        require(numElements > 0);
        require(randomNumber > 0);


        //STEP 1
        //Dichotomy to get the winner (randomNumber has been previously calculated)
        uint cursor = 0;
        uint inf = 0;
        uint sup = numElements - 1;
        uint test = 0;

        if(numElements > 1){
          //Winner is the last player
          if(randomNumber > gameSums[sup]){
            winner = gameAddresses[sup];
          } else{
            //Takes up to O(ln(n)) gas where n is the number of player
            while(  (sup > inf + 1) && ( (randomNumber <= gameSums[cursor])  || ((cursor+1<numElements) && (randomNumber > gameSums[cursor+1])) ) ){
                  test = inf + (sup - inf) / 2;
                  if(randomNumber > gameSums[test]){
                    inf = test;
                  } else{
                    sup = test;
                  }
                  cursor = inf;
            }
            winner = gameAddresses[cursor];
          }
        }
        else{
          winner = gameAddresses[0];
        }

        //STEP 2
        //Send earnings
        uint amountOne = uint ( (4 * totalAmount) / 100 );
        uint amountTwo = uint ( (1 * totalAmount) / 100 );
        uint amountThree = totalAmount - amountOne - amountTwo;
        earnings[beneficiaryOne] += amountOne;
        earnings[beneficiaryTwo] += amountTwo;
        earnings[winner] += amountThree;

        //STEP 3
        //Reset des variables
        gameNumber += 1;
        allGameAmount += totalAmount;
        gameBegin = now;
        gameEnd = now + 1 days;
        totalAmount = 0;
        randomNumber = 0;
        numberOfPlayers = 0;
        clearAddresses();
        clearSums();
    }
}