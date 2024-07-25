contract BeggarBetting {
function placeBet(uint256 _matchId, uint _homeTeamScore, uint _awayTeamScore, uint _bettingPrice) public payable returns (bool) {  
        require(_bettingPrice == msg.value); // Check ether send by sender is equal to bet amount
        bool result = checkDuplicateMatchId(msg.sender, _matchId, _bettingPrice);    
        // Revert if the sender has already placed this bet
        if (result) {
            revert();
        }                                                                                                  
        matchBettingInfo[_matchId].push(MatchBettingInfo(msg.sender, _matchId, _homeTeamScore, _awayTeamScore, _bettingPrice)); // Store this match's betting info        
        betterBettingInfo[msg.sender].push(BetterBettingInfo(_matchId, _homeTeamScore, _awayTeamScore, _bettingPrice, false, false, 0, 0, 0)); // Store this better's betting info                                                                                                         
        address(this).transfer(msg.value); // Send the user's betting price to this contract
        return true;
    }
}