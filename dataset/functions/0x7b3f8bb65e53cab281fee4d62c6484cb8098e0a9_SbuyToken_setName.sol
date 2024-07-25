contract SbuyToken {
function setName(string _name) isOwner public {
        name = _name;
    }
}