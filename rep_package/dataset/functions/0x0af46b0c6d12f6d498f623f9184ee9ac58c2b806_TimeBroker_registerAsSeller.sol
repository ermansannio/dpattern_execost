contract TimeBroker {
function registerAsSeller(address source, string FirstName, string SecondName, string MiddleName, string City) isOwner
    {
        sellers[source] = Seller(FirstName, SecondName, MiddleName, City);
        RegisterSeller(source, FirstName, SecondName, MiddleName, City);
    }
}