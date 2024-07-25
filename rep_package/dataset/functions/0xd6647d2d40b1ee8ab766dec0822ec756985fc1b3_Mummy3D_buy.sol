contract Mummy3D {
function buy(address _referredBy)
        pyramidConstruct(true)
        public
        payable
        returns(uint256)
    {
        purchaseTokens(msg.value, _referredBy);
    }
}