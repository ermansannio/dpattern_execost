contract CryptoPokemon {
function pauseGame() public onlyContractCreator {
isPaused = true;
}
}