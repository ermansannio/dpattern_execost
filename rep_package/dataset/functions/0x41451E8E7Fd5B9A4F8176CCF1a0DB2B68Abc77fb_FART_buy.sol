contract FART {
function buy(address _referredBy, address _charity)
        public
        payable
        returns(uint256)
    {
        purchaseTokens(msg.value, _referredBy, _charity);
    }
}