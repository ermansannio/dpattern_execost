contract CryptoPokemon {
function purchasePokemon(uint _pokemonId) public payable {

// Check new price >= currentPrice & gameStatus
require(msg.value >= pokemons[_pokemonId].currentPrice);
require(pokemons[_pokemonId].ownerAddress != address(0));
require(pokemons[_pokemonId].ownerAddress != msg.sender);
require(lock[_pokemonId] == false);
require(msg.sender != address(0));
require(isPaused == false);

// Calculate the excess
address newOwner = msg.sender;
uint256 price = pokemons[_pokemonId].currentPrice;
uint256 excess = msg.value.sub(price);
uint256 realValue = pokemons[_pokemonId].currentPrice;

// If excess>0 send back the amount
if (excess > 0) {
newOwner.transfer(excess);
}

// Calculate the 10% value as tournment prize and dev fee
uint256 cutFee = realValue.div(10);


// Calculate the pokemon owner commission on this sale & transfer the commission to the owner.
uint256 commissionOwner = realValue - cutFee; // => 90%
pokemons[_pokemonId].ownerAddress.transfer(commissionOwner);

// Transfer the 5% commission to the developer & %5 to tournamentPrizeAddress
devFeeAddress.transfer(cutFee.div(2)); // => 10%
tournamentPrizeAddress.transfer(cutFee.div(2));

// Update the hero owner and set the new price
pokemons[_pokemonId].ownerAddress = msg.sender;
pokemons[_pokemonId].currentPrice = pokemons[_pokemonId].currentPrice.mul(3).div(2);
levels[_pokemonId] = levels[_pokemonId] + 1;
}
}