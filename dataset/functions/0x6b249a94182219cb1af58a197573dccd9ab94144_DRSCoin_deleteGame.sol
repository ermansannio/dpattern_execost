contract DRSCoin {
function deleteGame (address gameAddress) public onlyOwner {
        require(allowedGameAddress[gameAddress] || proposedGames[gameAddress] > 0, "game must in allow list or proposed list");

        // delete gameAddress from allowedGameAddress
        allowedGameAddress[gameAddress] = false;

        // delete gameAddress from proposedGames
        proposedGames[gameAddress] = 0;
    }
}