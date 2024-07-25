contract WallCryptoStreet {
function InitiateCompanies() public onlyCeo {
        require(companiesAreInitiated == false);
        createCompany("Apple", 350000000000000000); 
        createCompany("Snapchat", 200000000000000000); 
        createCompany("Facebook", 250000000000000000); 
        createCompany("Google", 250000000000000000); 
        createCompany("Microsoft", 350000000000000000); 
        createCompany("Nintendo", 150000000000000000); 
        createCompany("Mc Donald", 250000000000000000); 
        createCompany("Kodak", 100000000000000000);
        createCompany("Twitter", 100000000000000000);

    }
}