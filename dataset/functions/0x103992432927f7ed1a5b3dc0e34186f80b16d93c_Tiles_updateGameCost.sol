contract Tiles {
function updateGameCost(uint newGameCost) onlyOwner returns (bool) {
        if (newGameCost > 0) {
            nextGameCost = newGameCost;
            willChangeCost = true;
        }
    }
}