contract GFDGSHBoard {
function purchasePixel(uint256 x, uint256 y, uint256 color) public payable {
        require(color < 16777216);
        uint256 pp = pixelPrice(x, y);
        require(msg.value >= pp);
        canvas[x][y] = color;
        ownerBalance += msg.value;
    }
}