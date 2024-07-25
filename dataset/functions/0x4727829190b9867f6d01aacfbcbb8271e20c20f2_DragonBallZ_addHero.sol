contract DragonBallZ {
function addHero(string heroName, address ownerAddress, uint256 currentPrice) public onlyContractCreator {
        heroes.push(Hero(heroName,ownerAddress,currentPrice));
    }
}