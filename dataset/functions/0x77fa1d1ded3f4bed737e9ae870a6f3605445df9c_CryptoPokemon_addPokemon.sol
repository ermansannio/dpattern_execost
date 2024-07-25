contract CryptoPokemon {
function addPokemon(string pokemonName, address ownerAddress, uint256 currentPrice) public onlyAdmins {
pokemons.push(Pokemon(pokemonName,ownerAddress,currentPrice));
levels[pokemons.length - 1] = 0;
lock[pokemons.length - 1] = false;
}
}