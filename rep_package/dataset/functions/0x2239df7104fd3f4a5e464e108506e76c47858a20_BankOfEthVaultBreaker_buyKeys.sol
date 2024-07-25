contract BankOfEthVaultBreaker {
function buyKeys(address _referer) public payable notOnPause {
        require(msg.value >= minInvestment);
        if(rounds.length > 0) {
            GameRound storage rnd = rounds[latestRoundID];   
               
            _purchase(rnd, msg.value, _referer);            
        } else {
            revert("Not yet started");
        }
        
    }
}