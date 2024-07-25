contract DRSCoin {
function proposeGame(address gameAddress) public onlyOwner {
        require(!allowedGameAddress[gameAddress], "game already in allow list");
        require(proposedGames[gameAddress] == 0, "game already in proposed list");

        // add gameAddress to proposedGames
        proposedGames[gameAddress] = now;
    }
}