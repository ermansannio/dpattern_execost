contract CompanyToken {
function createPromoCompany(address _owner, string _name, uint256 _price) public onlyCOO {
        require(promoCreatedCount < PROMO_CREATION_LIMIT);

        address companyOwner = _owner;
        if (companyOwner == address(0)) {
            companyOwner = cooAddress;
        }

        if (_price <= 0) {
            _price = startingPrice;
        }

        promoCreatedCount++;
        _createCompany(_name, companyOwner, _price);
    }
}