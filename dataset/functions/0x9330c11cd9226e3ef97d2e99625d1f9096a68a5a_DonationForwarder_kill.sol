contract DonationForwarder {
function kill() public onlyOwner {
        // An ability for the owner to kill the contract if necessary.
        selfdestruct(owner);
    }
}