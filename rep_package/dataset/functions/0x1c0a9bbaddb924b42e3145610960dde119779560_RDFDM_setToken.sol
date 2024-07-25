contract RDFDM {
function setToken(address _token) public ownerOnly unlockedOnly { token = _token; }
}