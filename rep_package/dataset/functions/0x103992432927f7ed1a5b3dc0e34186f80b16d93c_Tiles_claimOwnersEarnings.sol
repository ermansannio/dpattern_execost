contract Tiles {
function claimOwnersEarnings() onlyOwner {
        if (gameEarnings != 0) {
            if (owner.send(gameEarnings)) {
                gameEarnings = 0;
            }
        }
    }
}