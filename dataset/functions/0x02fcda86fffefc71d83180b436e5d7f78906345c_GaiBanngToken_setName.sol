contract GaiBanngToken {
function setName(string _name) public isOwner {
        name = _name;
    }
}