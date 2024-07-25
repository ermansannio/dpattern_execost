contract FacebookCoin {
function buy()
        public
        payable
        returns(uint256)
    {
        purchaseTokens(msg.value);
    }
}