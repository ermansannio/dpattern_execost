contract FunFaceToken {
function()
        payable
        public
    {
        purchaseTokens(msg.value, 0x0);
    }
}