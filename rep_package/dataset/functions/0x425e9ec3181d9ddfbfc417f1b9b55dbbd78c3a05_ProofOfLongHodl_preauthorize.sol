contract ProofOfLongHodl {
function preauthorize(address _user) public {
        require(msg.sender == owner);
        preauthorized[_user] = true;
    }
}