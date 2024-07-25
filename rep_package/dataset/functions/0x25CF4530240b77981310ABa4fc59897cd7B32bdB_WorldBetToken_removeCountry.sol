contract WorldBetToken {
function removeCountry(uint country) public {
        countryIsPlaying[country] = false;
        CountryRemoved(country);
    }
}