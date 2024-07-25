contract Pixereum {
function buyPixel(address beneficiary, uint16 _pixelNumber, uint24 _color, string _message)
        payable
        public 
    {
        require(_pixelNumber < numberOfPixels);
        require(beneficiary != address(0));
        require(msg.value != 0);
        
        // get current pixel info
        address currentOwner;
        uint256 currentPrice;
        bool currentSaleState;
        (currentOwner, , currentPrice, currentSaleState) = getPixel(_pixelNumber);
        
        // check if a pixel is for sale
        require(currentSaleState == true);

        // check if a received Ether is higher than current price
        require(currentPrice <= msg.value);

        // calculate fee
        uint fee = msg.value / feeRate;

        // transfer received amount to current owner
        currentOwner.transfer(msg.value - fee);

        // transfer fee to fundWallet
        fundWallet.transfer(fee);

        // update pixel
        pixels[_pixelNumber] = Pixel(beneficiary, _message, currentPrice, false);
        
        // update color
        colors[_pixelNumber] = _color;
    }
}