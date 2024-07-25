contract ChessLotto {
function AddTicket() public payable 
    {
        require(msg.value == ticketPrice); 
        require(numtickets < maxTickets);
        
		//update bif
		lastTicketTime = now;
        numtickets += 1;
        totalBounty += ticketPrice;
        bool success = numtickets == maxTickets;
		
        NewTicket(msg.sender, success);
        
		//check if winner
        if(success) 
        {
            PayWinner(msg.sender);
        } 
    }
}