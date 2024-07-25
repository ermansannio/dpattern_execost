contract SmzTradingContract {
function addAllowedAddress(address _allowedAddress) public
    {
        require(msg.sender == manager);
        addressesAllowed[_allowedAddress] = true;
    }
}