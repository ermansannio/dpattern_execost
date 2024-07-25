contract GameTable {
function contribute(uint gameinx,uint optioninx)  public payable {
        if ((gameinx<0)||(gameinx>999999999999999999999999999999999999)||(optioninx<0)) revert();
        if (optioninx >= games[gameinx].numOptions) revert();
        if (now <= games[gameinx].startTime) revert();
        if (now >= games[gameinx].endTime) revert();
        //1000000000000000000=1eth
        //5000000000000000  = 0.005 ETH
        if (msg.value<5000000000000000 || msg.value>1000000000000000000000000000) revert();
        if (games[gameinx].amount > 99999999999999999999999999999999999999999999999999999999) revert();

        games[gameinx].options[optioninx].players[games[gameinx].options[optioninx].numPlayers++] = Player({addr: msg.sender, amount: msg.value, profit:0});
        games[gameinx].options[optioninx].amount = games[gameinx].options[optioninx].amount.add(msg.value);
        games[gameinx].options[optioninx].playeramounts[msg.sender] = games[gameinx].options[optioninx].playeramounts[msg.sender].add(msg.value);
        games[gameinx].amount = games[gameinx].amount.add(msg.value);
    }
}