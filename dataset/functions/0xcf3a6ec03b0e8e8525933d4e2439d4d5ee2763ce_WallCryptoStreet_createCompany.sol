contract WallCryptoStreet {
function createCompany(string _companyName, uint256 _companyPrice) public onlyCeo {
        uint companyId = companies.push(Company(_companyName, cfoAddress, _companyPrice, 10000000000000000, "0", "#",0)) - 1;
        // The initial price of a share is always the initial price of a company / 10.
        uint256 sharePrice = _companyPrice / 10;
        
        // We create 5 shares for this company
        shares.push(Share(companyId, cfoAddress, sharePrice));
        shares.push(Share(companyId, cfoAddress, sharePrice));
        shares.push(Share(companyId, cfoAddress, sharePrice));
        shares.push(Share(companyId, cfoAddress, sharePrice));
        shares.push(Share(companyId, cfoAddress, sharePrice));
    }
}