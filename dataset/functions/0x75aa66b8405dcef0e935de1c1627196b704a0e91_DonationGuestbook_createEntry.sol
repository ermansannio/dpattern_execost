contract DonationGuestbook {
function createEntry(string _alias, string _message) payable public {
    // called by a donator to make a donation + guestbook entry
        require(msg.value > minimum_donation); // entries only for those that donate something
        entries[running_id] = Entry(msg.sender, _alias, block.timestamp, block.number, msg.value, _message);
        running_id++;
        donationWallet.transfer(msg.value);
    }
}