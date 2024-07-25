contract SmzTradingContract {
function addMultipleAllowedAddresses(address[] _allowedAddresses) external
    {
        require(msg.sender == manager);
        for (uint256 i=0; i<_allowedAddresses.length; i++)
        {
            addressesAllowed[_allowedAddresses[i]] = true;
        }
    }
}