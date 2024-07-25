contract ZEROxBTCHate {
function IHate0xBTC(string reason) public {
        uint hash = uint(keccak256(bytes(reason)));
        if (!ZEROxBTCHaters[hash]){
            // congratulations we found new hate for 0xBTC!
            // reward: an 0xBTC hate token 
            ZEROxBTCHaters[hash] = true; 
            balanceOf[msg.sender] += (10 ** 18);
            for (uint i = 0; i < 100; i++) {
                emit Transfer(0xB6eD7644C69416d67B522e20bC294A9a9B405B31, msg.sender, 10**18); // kek 
            }
            emit New0xBTCHate(msg.sender, reason);
            totalSupply += (10 ** 18); // CANNOT OVERFLOW THIS BECAUSE WE ONLY HAVE UINT HASHES (HACKERS BTFO)
        }
    }
}