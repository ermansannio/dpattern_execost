contract Memes {
function Buy(uint8 ID, string says) public payable {
        require(ID < SIZE);
        var ITM = ItemList[ID];
        if (TimeFinish == 0){
            // start game condition.
            TimeFinish = block.timestamp; 
        }
        else if (TimeFinish == 1){
            TimeFinish =block.timestamp + TimerResetTime;
        }
            
        uint256 price = ITM.CPrice;
        
        if (ITM.reset){
            price = BasicPrice;
            
        }
        
        if (msg.value >= price){
            if (!ITM.reset){
                require(msg.sender != ITM.owner); // do not buy own item
            }
            if ((msg.value - price) > 0){
                // pay excess back. 
                msg.sender.transfer(msg.value - price);
            }
            uint256 LEFT = DoDev(price);
            uint256 prev_val = 0;
            // first item all LEFT goes to POT 
            // not previous owner small fee .
            uint256 pot_val = LEFT;
            
            address sender_target = owner;
            
            if (!ITM.reset){
                prev_val = (DIVP * LEFT)  / 10000;
                pot_val = (POTP * LEFT) / 10000;
                sender_target = ITM.owner; // we set sender_target to item owner
            }
            else{
                // Item is reset, send stuff to dev
                // Actually we can just send everything here aka LEFT
                prev_val = LEFT;
                pot_val = 0; // nothing in pot
                // no need to set sender value
            }
            
            Pot = Pot + pot_val;
            sender_target.transfer(prev_val); // send stuff to sender_target
            ITM.owner = msg.sender;
            uint256 incr = PIncr; // weird way of passing other types to new types.
            ITM.CPrice = (price * (10000 + incr)) / 10000;

            // check if TimeFinish > block.timestamp; and not 0 otherwise not started
            uint256 TimeLeft = TimeFinish - block.timestamp;
            
            if (TimeLeft< TimerStartTime){
                
                TimeFinish = block.timestamp + TimerStartTime;
            }
            if (ITM.reset){
                ITM.reset=false;
            }
            PotOwner = msg.sender;
            // says is for later, for quotes in log. no gas used to save
            emit ItemBought(msg.sender, ITM.CPrice, says, ID);
        }  
        else{
            revert(); // user knows fail.
        }
    }
}