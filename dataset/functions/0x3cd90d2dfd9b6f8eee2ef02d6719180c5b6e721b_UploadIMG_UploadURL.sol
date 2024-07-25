contract UploadIMG {
function UploadURL(uint256 ID, string URL) public {
        Data[msg.sender][ID] = URL;
    }
}