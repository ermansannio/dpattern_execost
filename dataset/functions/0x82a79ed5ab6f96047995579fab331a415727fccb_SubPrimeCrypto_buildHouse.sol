contract SubPrimeCrypto {
function buildHouse() payable public {
        if (houseCredits[msg.sender] > 0) {
            houseCredits[msg.sender]--;
        } else {
            require(msg.value >= buildPrice);
            if (presaleOngoing) presaleSales++;
        }

        generateHouse(msg.sender);
    }
}