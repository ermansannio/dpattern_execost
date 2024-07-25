contract NFTHouseGame {
function buildHouse() payable public {
        require(
          msg.value >= buildPrice ||
          msg.sender == gameOwner ||
          msg.sender == gameDeveloper
        );

        if (presaleOngoing) {
          presaleSales++;
          presaleProceeds += msg.value;
        }

        generateHouse(msg.sender);
    }
}