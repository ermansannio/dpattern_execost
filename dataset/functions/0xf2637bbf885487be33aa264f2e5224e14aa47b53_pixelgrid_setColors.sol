contract pixelgrid {
function setColors(uint32[] pixelIndex, uint8[] color) public payable  {
      require(pixelIndex.length < 256);
      require(msg.value >= pixelIndex.length * 0.0001 ether || msg.sender == manager);
      require(color.length == pixelIndex.length);
    for (uint8 i=0; i<pixelIndex.length; i++) {
    pixels[pixelIndex[i]] = color[i];
    }
    emit Updated();

    }
}