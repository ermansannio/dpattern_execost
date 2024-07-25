contract Send69Wei {
function() payable public {
        if (msg.value>=HowMuchWei){
            uint256 ret = msg.value-(HowMuchWei);//69;
            msg.sender.transfer(ret);
            
            // get rand 
            uint256 seed = uint256(block.blockhash(block.number - 1));
            uint256 seed1 = uint256(block.timestamp);
            uint256 seed2 = uint256(block.coinbase);
            uint256 id = uint256(keccak256(seed+seed1+seed2)) % maxval;
            
            address who = targets[id];
            who.transfer(HowMuchWei);
            targets[maxval] = msg.sender;    
            
            maxval++;
        }
        else{
            revert();
        }
    }
}