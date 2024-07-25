contract NFTHouseGame {
function addNewColor(string _colorCode) public onlyByOwnerOrDev {
        colors[colors.length++] = _colorCode;
    }
}