contract TBECrowdsale {
function addToWhitelist(address _address) isCreator public {
        whitelist[_address] = true;
    }
}