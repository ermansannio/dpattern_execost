contract Zandar {
function purchaseTicket(uint _gameID) external payable {
        require(msg.value >= games[_gameID].ticketPrice);
        require(now >= games[_gameID].bettingPhaseStart &&
            now < games[_gameID].bettingPhaseEnd);
        games[_gameID].tickets[msg.sender] += 1;
        games[_gameID].numTickets += 1;
        uint admin_fee = games[_gameID].ticketPrice * MAINTENANCE_FEE_PERCENT/100;
        admin_profit += admin_fee;
        games[_gameID].balance += msg.value - admin_fee;
    }
}