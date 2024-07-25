contract Lottery4 {
function changeSeed(uint32 n) public {
        if (msg.sender == owner) {
            seed = uint(n);
            seed = uint(block.blockhash(block.number-seed))%2000 + 1; 
        }
        else {
            revert();
        }
    }
}