contract BrandContest {
function buyTicket(string _key) public payable {
        require(msg.sender != address(0));
        Contest storage contest = contests[_key];
        require(contest.open == true);
        require(msg.value >= contest.ticket_price);
        
        contest.tickets[contest.tickets_sold] = msg.sender;
        contest.tickets_sold++;
        
        if(msg.value > contest.ticket_price){
            msg.sender.transfer(SafeMath.sub(msg.value, contest.ticket_price));
        }
    }
}