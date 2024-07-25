contract Win20ETH {
function buyTicket() public payable {

	    require(msg.value == ticketPrice);
	    bool found = false;
	    for(uint i=0; i< games[block.number+blockOffset].gamers.length;i++){
	      if( msg.sender == games[block.number+blockOffset].gamers[i]){
	        found = true;
	        break;
	      }
	    }
	    require(found == false);
	    jackpot+=msg.value;
	    games[block.number+blockOffset].gamers.push(msg.sender);
	    games[block.number+blockOffset].pays[msg.sender] = false;


	}
}