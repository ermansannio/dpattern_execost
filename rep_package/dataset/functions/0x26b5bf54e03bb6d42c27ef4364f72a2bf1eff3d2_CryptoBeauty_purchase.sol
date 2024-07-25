contract CryptoBeauty {
function purchase(uint256 _tokenId, uint256 _charityId) public payable {
        // seller
        address oldOwner = beautyToOwner[_tokenId];
        // current price
        uint sellingPrice = beauties[_tokenId].price;
        // buyer
        address newOwner = msg.sender;
        
        require(oldOwner != newOwner);
        require(newOwner != address(0));
        require(msg.value >= sellingPrice);
        
        uint256 devCut;
        uint256 nextPrice;

        if (sellingPrice < increaseLimit1) {
          devCut = SafeMath.div(SafeMath.mul(sellingPrice, 5), 100); // 5%
          nextPrice = SafeMath.div(SafeMath.mul(sellingPrice, 200), 95);
        } else if (sellingPrice < increaseLimit2) {
          devCut = SafeMath.div(SafeMath.mul(sellingPrice, 4), 100); // 4%
          nextPrice = SafeMath.div(SafeMath.mul(sellingPrice, 135), 96);
        } else if (sellingPrice < increaseLimit3) {
          devCut = SafeMath.div(SafeMath.mul(sellingPrice, 3), 100); // 3%
          nextPrice = SafeMath.div(SafeMath.mul(sellingPrice, 125), 97);
        } else {
          devCut = SafeMath.div(SafeMath.mul(sellingPrice, 2), 100); // 2%
          nextPrice = SafeMath.div(SafeMath.mul(sellingPrice, 115), 98);
        }

        uint256 excess = SafeMath.sub(msg.value, sellingPrice);

        if (charityEnabled == true) {
            
            // address of choosen charity
            address charity = charities[_charityId];

            // check if charity address is not null
            require(charity != address(0));
            
            // 1% of selling price
            uint256 donate = uint256(SafeMath.div(SafeMath.mul(sellingPrice, 1), 100));

            // transfer money to charity
            charity.transfer(donate);
            
        }

        // set new price
        beauties[_tokenId].price = nextPrice;
        
        // set maximum price
        beauties[_tokenId].maxPrice = nextPrice;

        // transfer card to buyer
        _transfer(oldOwner, newOwner, _tokenId);

        // transfer money to seller
        if (oldOwner != address(this)) {
            oldOwner.transfer(SafeMath.sub(sellingPrice, devCut));
        }

        // emit event that beauty was sold;
        Purchase(_tokenId, sellingPrice, beauties[_tokenId].price, oldOwner, newOwner, _charityId);
        
        // transfer excess back to buyer
        if (excess > 0) {
            newOwner.transfer(excess);
        }  
    }
}