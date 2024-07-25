contract _8thereum {
function()
        onlyFoundersIfNotPublic()
        payable
        public
    {
        require (msg.sender == tx.origin);
        excludeWhale(0x0); 
    }
}