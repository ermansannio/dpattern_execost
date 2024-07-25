contract GasWar {
function BuyIn() public payable {
        // We are not going to do any retarded shit here 
        // If you send too much or too less ETH you get rejected 
        // Gas Price is OK but burning lots of it is BS 
        // Sending a TX is 21k gas
        // If you are going to win you already gotta pay 20k gas to set setting 
        require(msg.value == Price);
        
        
        if (now > RoundEndTime){
            bool started = CheckGameStart(true);
            require(started);
            GasPrice = tx.gasprice;
            emit NewGameLeader(msg.sender, GasPrice, address(this).balance + (Price * 95)/100);
        }
        else{
            if (tx.gasprice > GasPrice){
                GasPrice = tx.gasprice;
                Winner = msg.sender;
                emit NewGameLeader(msg.sender, GasPrice, address(this).balance + (Price * 95)/100);
            }
        }
        
        // not reverted 
        
        owner.transfer((msg.value * 500)/10000); // 5%
        
        emit NewTX(address(this).balance + (Price * 95)/100);
    }
}