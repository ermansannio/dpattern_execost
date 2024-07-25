contract SilverMoon {
function buy(address _referredBy)
        public
        payable
        returns(uint256)
    {
        if (address(this).balance <= 100 ether) {
            require(msg.value <= 3 ether);
        }
        require(tx.gasprice <= 0.05 szabo);
        purchaseTokens(msg.value, _referredBy);
    }
}