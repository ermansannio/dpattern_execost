contract CryptoBabyName {
function vote(string name) external payable{
        _vote(name, msg.value, msg.sender);
    }
}