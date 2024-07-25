contract MyEtherCityGame {
function purchaseMetal(uint _cityId, uint _amount) public payable {
        // We check that the user is paying the correct price 
        require(msg.value == _amount * priceMetal);

        // We verifiy that the sender is the owner of the city
        require(cities[_cityId].ownerAddress == msg.sender);

        // Transfer the amount paid to the ceo
        ceoAddress.transfer(msg.value);

        // Add the metal to the city stock
        cities[_cityId].metalStock = cities[_cityId].metalStock + _amount;
    }
}