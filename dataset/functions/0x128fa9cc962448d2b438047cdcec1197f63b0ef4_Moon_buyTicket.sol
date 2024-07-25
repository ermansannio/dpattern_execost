contract Moon {
function buyTicket() public payable {
        require((now <= gameEnd) || (totalAmount == 0));
        //Close to the dollar , Euro value
        require(msg.value > 1000000000000000);
        require(ticketsForGame[msg.sender] < gameNumber);
        require(msg.value + totalAmount < 2000000000000000000000);
        require(randomNumber == 0);

        //I add the address if necessary. I reset his participation if necessary
        ticketsForGame[msg.sender] = gameNumber;
        tickets[msg.sender] = 0;
        insertAddress(msg.sender);
        insertSums(totalAmount);

        //I set player participation to this lottery
        tickets[msg.sender] = msg.value;
        totalAmount += msg.value;
        numberOfPlayers += 1;
    }
}