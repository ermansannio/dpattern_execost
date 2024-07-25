contract DRSCoin {
function addGame(address gameAddress) public onlyOwner {
        require(!allowedGameAddress[gameAddress], "game already in allow list");
        require(proposedGames[gameAddress] > 0, "game must be in proposed list first");
        require(now > proposedGames[gameAddress].add(proposingPeriod), "game must be debated for 2 days");

        // add gameAddress to allowedGameAddress
        allowedGameAddress[gameAddress] = true;

        // delete gameAddress from proposedGames
        proposedGames[gameAddress] = 0;
    }
}