contract Tiles {
function claimTile(uint xCoord, uint yCoord, uint gameNumber) gameRunning payable {
        if (gameNumber != currentGameNumber || tiles[xCoord][yCoord].gameClaimed == currentGameNumber) {
            revert();
        }
        require(msg.value == currentGameCost);

        currentGameBalance += msg.value;
        tiles[xCoord][yCoord] = Tile(currentGameNumber, msg.sender);
        TileClaimed(currentGameNumber, xCoord, yCoord, msg.sender);
        numTilesClaimed += 1;
        if (numTilesClaimed == NUM_TILES) {
            determineWinner();
        }
    }
}