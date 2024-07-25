contract CompanyToken {
function createContractCompany(string _name) public onlyCOO {
        _createCompany(_name, address(this), startingPrice);
    }
}