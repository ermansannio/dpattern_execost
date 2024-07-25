contract Quicketh {
function play()  payable public{
       require (msg.value == playPrice);
       playedWallets.push(msg.sender);
       players += 1;
       AnotherPlayer(msg.sender);
       if (players > 9){
           uint random_number = uint(block.blockhash(block.number-1))%10 + 1;    // Get random winner
           winners.push(playedWallets[random_number]);                           // Add to winner list
           playedWallets[random_number].transfer(8*playPrice);                   // Send price to winner
           WinnerWinnerChickenDinner(playedWallets[random_number], 8*playPrice); // Notify the world
           owner.transfer(this.balance);                                         // Let's get the profits :)
           rounds += 1;                                                          // See how long we've been going
           players = 0;                                                          // reset players
           delete playedWallets;                                                 // get rid of the player addresses
       }
   }
}