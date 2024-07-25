contract PixelOperationsContract {
function buyFreePixels(uint256 tX, uint256 tY, uint256 bX, uint256 bY) public payable returns(bool) {
		
		bytes32 pxHash = keccak256(tX,tY,bX,bY);
		uint256 pxCount = (bX-tX) * (bY-tY);
		uint256 blockPrice = getQuotes() * pxCount;

		require(msg.value >= blockPrice);
		require(pixelsOwned[pxHash] == 0x0000000000000000000000000000000000000000);
		
		owner.transfer(msg.value);
		pixelsOwned[pxHash] = msg.sender;
		pixelsSold = pixelsSold + pxCount;		

		return true;
	}
}