contract GiftCard2017 {
function () public payable {                               // Accept ether only because some clients require it.
        uint256 _redemption = authorizations[msg.sender];      // Amount mEth available to redeem.
        require (_redemption > 0);
        authorizations[msg.sender] = 0;                        // Clear authorization.
        msg.sender.transfer(_redemption * 1e15 + msg.value);   // convert mEth to wei for transfer()
    }
}