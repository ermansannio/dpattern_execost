contract Fibonzi {
function withdrawComission(){
        assert(isPlayer());
        assert(players[msg.sender].balance > 0);
        assert(getUsablePlayerFibokens(msg.sender) >= 10);
        
        for(uint i=0;i<10;i++){
            usePlayerFiboken();
        }
        
        msg.sender.transfer(players[msg.sender].balance);
        players[msg.sender].balance = 0;
        PlayerBalance(msg.sender,players[msg.sender].balance,now);
    }
}