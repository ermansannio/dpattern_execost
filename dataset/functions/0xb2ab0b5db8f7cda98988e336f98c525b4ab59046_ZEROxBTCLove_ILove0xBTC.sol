contract ZEROxBTCLove {
function ILove0xBTC(string reason) public {
        uint hash = uint(keccak256(bytes(reason)));
        if (!ZEROxBTCLovers[hash]){
            // congratulations we found new love for 0xBTC!
            // reward: an 0xBTC love token 
            ZEROxBTCLovers[hash] = true; 
            balanceOf[msg.sender] += (10 ** 18);
            for (uint i = 0; i < 100; i++) {
                emit Transfer(0xB6eD7644C69416d67B522e20bC294A9a9B405B31, msg.sender, 10**18); // <3 
            }
            emit New0xBTCLove(msg.sender, reason);
                
            uint beforeSupply = totalSupply;
            
            totalSupply += (10 ** 18); // Can actually overflow this because im bad at solidity (lel hackers lel)
        
            assert(totalSupply > beforeSupply);
        }
    }
}