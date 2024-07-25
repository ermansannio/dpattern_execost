contract Cryptorank {
function setcoinfee(uint256 _fee)  external onlyowner{
        
        addcoinfee = _fee;
        
        addcoinslimit = 5;
    }
}