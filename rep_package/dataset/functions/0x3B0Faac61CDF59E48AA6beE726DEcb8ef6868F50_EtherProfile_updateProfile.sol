contract EtherProfile {
function updateProfile(
        string name,
        string imgurl,
        string email,
        string aboutMe
    ) public
    {
        address _address = msg.sender;
        Profile storage p = addressToProfile[_address];
        p.name = name;
        p.imgurl = imgurl;
        p.email = email;
        p.aboutMe = aboutMe;
    }
}