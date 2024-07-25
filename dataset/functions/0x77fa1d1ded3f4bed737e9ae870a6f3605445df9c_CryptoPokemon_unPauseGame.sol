contract CryptoPokemon {
function unPauseGame() public onlyContractCreator {
isPaused = false;
}
}