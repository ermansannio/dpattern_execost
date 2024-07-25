contract CryptonomicaVerification {
function withdrawAllToWithdrawalAddress() public returns (bool) {// (!) Gas requirement: infinite
        // http://solidity.readthedocs.io/en/develop/security-considerations.html#sending-and-receiving-ether
        // about <address>.send(uint256 amount) and <address>.transfer(uint256 amount)
        // see: http://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=transfer#address-related
        // https://ethereum.stackexchange.com/questions/19341/address-send-vs-address-transfer-best-practice-usage
        uint sum = this.balance;
        if (!withdrawalAddress.send(this.balance)) {// makes withdrawal and returns true or false
            Withdrawal(withdrawalAddress, sum, msg.sender, false);
            return false;
        }
        Withdrawal(withdrawalAddress, sum, msg.sender, true);
        return true;
    }
}