contract PoorguyDonation {
function Donate(string quote) public payable {
        require(msg.sender != Donated); // GTFO dont donate to yourself
        
        emit Quote(msg.sender, quote, msg.value);
    }
}