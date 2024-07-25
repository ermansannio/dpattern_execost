contract CryptoDivert {
function RetrieveCommissions() external OnlyByAdmin() {
        // The fees are the remainder of the contract balance after the userBalance and privacyFund
        // reservations have been substracted. 
        uint256 pendingBalance = userBalance.add(privacyFund);
        uint256 commissions = address(this).balance.sub(pendingBalance);
        
        // Transfer the commissions.
        msg.sender.transfer(commissions);
        
        // Double check that our admin is correct.
        assert(address(this).balance >= userBalance);
    }
}