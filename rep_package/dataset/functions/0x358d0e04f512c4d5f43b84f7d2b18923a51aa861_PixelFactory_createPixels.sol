contract PixelFactory {
function createPixels(uint amount) public onlyOwner {
        // it can be max 400 pixels
        require(pixels.length + amount <= 400);
        
        // P.S. creating 400 pixels in one time is costing too much gas that's why we are using amount
        
        // system is creating pixels
        for(uint i=0; i<amount; i++) {
            uint id = pixels.push(Pixel(startPrice)) - 1;
            pixelToOwner[id] = msg.sender;
        }
    }
}