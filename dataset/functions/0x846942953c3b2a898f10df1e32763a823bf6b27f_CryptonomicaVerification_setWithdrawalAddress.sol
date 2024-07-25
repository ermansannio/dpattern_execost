contract CryptonomicaVerification {
function setWithdrawalAddress(address _withdrawalAddress) public {
        require(msg.sender == owner);
        require(!withdrawalAddressFixed);
        WithdrawalAddressChanged(withdrawalAddress, _withdrawalAddress, msg.sender);
        withdrawalAddress = _withdrawalAddress;
    }
}