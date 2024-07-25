contract Parallax {
function() payable {
        
        // Rule 1: You can only send multiples of 0.002 ether.
        require(msg.value % 2 finney == 0);
        
        // Rule 2: You can't close the game by becoming the highest bidder.
        if(msg.value > highestBid)
            require(this.balance - msg.value < deadline);
        
        // Reassign limits.
        if(msg.value < lowestBid)   lowestBid = msg.value;
        if(msg.value > highestBid)  highestBid = msg.value;
        
        
        // Set the last bidder for the price.
        cup[msg.value] = msg.sender;
        
        // Check if the deadline was reached.
        if(this.balance >= deadline) {
            
            // Winning condition: The last bidder of the average price
            // get the chicken.
            uint finderAmount = (highestBid + lowestBid)/2;
            address finderAddress = cup[finderAmount];
            
            // If no one guessed correctly, give the chicken to the
            // the fattest bidder.
            if (finderAddress == 0x0)
                finderAddress = cup[highestBid];
            
            // Reset the limits for the next game.
            highestBid = 0;
            lowestBid = deadline*2;
            
            // Send the chicken to the winner and pay the commission
            // to the owner. Fee for a successful game is 0.01 ether. 
            finderAddress.transfer(this.balance - 100 finney);
            referee.transfer(100 finney);
        } 
        
    }
}