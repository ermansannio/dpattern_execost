contract ExternalCurrencyPrice {
function setPrice(string currency, uint64 value, uint8 decimals)
        public
        onlyAdministrator
    {
        prices[currency].value = value;
        prices[currency].decimals = decimals;
        PriceSet(currency, value, decimals);
    }
}