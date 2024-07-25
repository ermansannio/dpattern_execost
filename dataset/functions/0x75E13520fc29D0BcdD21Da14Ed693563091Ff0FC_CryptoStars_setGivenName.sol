contract CryptoStars {
function setGivenName(uint starIndex, string name) {
        if (starIndexToAddress[starIndex] != msg.sender) throw;     //Only allow star owner to change GivenName
        starIndexToSTRZName[starIndex] = name;
        Assign(msg.sender, starIndex, starIndexToSTRZName[starIndex], starIndexToSTRZMasterName[starIndex]);  //Update Info
    }
}