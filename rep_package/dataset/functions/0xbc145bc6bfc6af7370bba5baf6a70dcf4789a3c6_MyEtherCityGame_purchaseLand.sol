contract MyEtherCityGame {
function purchaseLand(uint _landId, uint _typePurchase, uint _commission) public payable {
        require(lands[_landId].landForSale == true);
        require(msg.value == lands[_landId].landPrice);

        // Transfer the amount paid to the previous land owner
        lands[_landId].ownerAddress.transfer(msg.value);

        // Update the land
        lands[_landId].ownerAddress = msg.sender;
        lands[_landId].landForSale = false;

        /// _typePurchase:
        /// 0: Create city
        /// 1: Rent the land
        /// 2: Cancel sale
        
        if(_typePurchase == 0) {
            // The user in purchasing the land to build the city on top of it we create the city directly
            createCity(_landId);
        } else if(_typePurchase == 1) {
            // The user is purchasing the land to rent it to another user
            lands[_landId].landForRent = true;
            lands[_landId].landForSale = false;
            lands[_landId].landOwnerCommission = _commission;
        } 
    }
}