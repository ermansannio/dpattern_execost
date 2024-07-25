contract CryptoVideoGames {
function addVideoGame(string videoGameName, address ownerAddress, uint256 currentPrice) public onlyContractCreator {
        videoGames.push(VideoGame(videoGameName,ownerAddress,currentPrice));
    }
}