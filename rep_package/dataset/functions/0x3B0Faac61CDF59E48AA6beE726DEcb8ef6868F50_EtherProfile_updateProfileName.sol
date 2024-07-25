contract EtherProfile {
function updateProfileName(string name) public {
        address _address = msg.sender;
        Profile storage p = addressToProfile[_address];
        p.name = name;
    }
}