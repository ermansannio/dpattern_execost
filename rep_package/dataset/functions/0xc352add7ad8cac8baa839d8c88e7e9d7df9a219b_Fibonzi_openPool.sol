contract Fibonzi {
function openPool(uint8 poolId) payable{
        assert(poolCount >= poolId);
        assert(isPlayer());
        assert(msg.value >= pools[poolId].price);
        assert(getUsablePlayerFibokens(msg.sender) > 0);
        assert(usePlayerFiboken());
        
        uint price = pools[poolId].price;
        owner.transfer(price);
        pools[poolId].owner = msg.sender;
        
        if(msg.value > pools[poolId].price){
            msg.sender.transfer(msg.value - pools[poolId].price);
        }
        
        pools[poolId].price = 4*price;
        PoolJoined(poolId,msg.sender,pools[poolId].price,now);
        ++transactionsCount;
        
        if(fibonacciIndex <= fibonacciMax){
            createPoolsIfNeeded();
        }
        getPoolPrices();
    }
}