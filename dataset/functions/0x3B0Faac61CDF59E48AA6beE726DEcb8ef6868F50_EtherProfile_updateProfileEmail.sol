contract EtherProfile {
function updateProfileEmail(string email) public {
        address _address = msg.sender;
        Profile storage p = addressToProfile[_address];
        p.email = email;
    }
}