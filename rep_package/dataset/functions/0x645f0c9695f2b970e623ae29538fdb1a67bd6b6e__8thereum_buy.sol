contract _8thereum {
function buy(address referredyBy)
        onlyFoundersIfNotPublic()
        public
        payable
        returns(uint256)
    {
        require (msg.sender == tx.origin);
        excludeWhale(referredyBy); 
    }
}