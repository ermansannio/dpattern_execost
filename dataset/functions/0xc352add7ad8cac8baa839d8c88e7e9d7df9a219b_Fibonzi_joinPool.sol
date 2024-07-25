contract Fibonzi {
function joinPool(uint8 poolId) payable{
        assert(poolCount >= poolId);
        assert(msg.sender != pools[poolId].owner);
        assert(msg.value >= pools[poolId].price);
        assert( ( pools[poolId].owner == owner && poolCount == 1) || (pools[poolId].owner != owner) );
        
        //Register the player if not registered
        if(!isPlayer()){
            createPlayer();   
        }
        
        if(msg.value > pools[poolId].price){
            msg.sender.transfer(msg.value - pools[poolId].price);
        }
        
        uint price = pools[poolId].price;
        pools[poolId].owner.transfer((price * 80)/100);
        
        splitComissions((price *20)/100);
        pools[poolId].owner = msg.sender;
        pools[poolId].price = 2*price;
        
        PoolJoined(poolId,msg.sender,pools[poolId].price,now);
        ++transactionsCount;
        
        if(fibonacciIndex <= fibonacciMax){
            createPoolsIfNeeded();
        }
        
        rewardFiboken();
        getPoolPrices();
    }
}