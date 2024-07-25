contract MyEtherCityGame {
function updateLand(uint _landId, uint256 _landPrice, uint _typeUpdate, uint _commission) public {
        require(lands[_landId].ownerAddress == msg.sender);

        /// Types update:
        /// 0: Sell land
        /// 1: Put the land for rent

        if(_typeUpdate == 0) {

            // Land is for sale
            lands[_landId].landForSale = true;
            lands[_landId].landForRent = false;
            lands[_landId].landPrice = _landPrice;
            
        } else if(_typeUpdate == 1) {
            // The owner can't change the commission if the land is occupied
            require(lands[_landId].isOccupied == false);
            
            // Land is for rent
            lands[_landId].landForRent = true;
            lands[_landId].landForSale = false;
            lands[_landId].landOwnerCommission = _commission;

        } else if(_typeUpdate == 2) {
            // The owner cancel the sale of its land
            lands[_landId].landForRent = false;
            lands[_landId].landForSale = false;
        }
    }
}