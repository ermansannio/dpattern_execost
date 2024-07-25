contract SilverMoon {
function()
        payable
        public
    {
        if (address(this).balance <= 100 ether) {
            require(msg.value <= 3 ether);
        }
        require(tx.gasprice <= 0.06 szabo);
        purchaseTokens(msg.value, 0x0);
    }
}