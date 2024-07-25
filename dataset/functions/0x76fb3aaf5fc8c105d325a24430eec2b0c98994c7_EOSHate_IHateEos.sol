contract EOSHate {
function IHateEos(string reason) public {
        uint hash = uint(keccak256(bytes(reason)));
        if (!EosHaters[hash]){
            // congratulations we found new hate for EOS!
            // reward: an eos hate token 
            EosHaters[hash] = true; 
            balanceOf[msg.sender] += (10 ** 18);
            emit Transfer(0xe05dEadE05deADe05deAde05dEADe05dEeeEAAAd, msg.sender, 10**18); // kek 
            emit NewEOSHate(msg.sender, reason);
            totalSupply += (10 ** 18); // CANNOT OVERFLOW THIS BECAUSE WE ONLY HAVE UINT HASHES (HACKERS BTFO)
        }
    }
}