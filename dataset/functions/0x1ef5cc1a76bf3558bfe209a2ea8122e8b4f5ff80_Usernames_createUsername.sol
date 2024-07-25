contract Usernames {
function createUsername(string _userName) external returns (bool) {
        require(bytes(usernames[msg.sender]).length == 0);
        require(dedupeList[_userName] == 0);
        require(bytes(_userName).length >= 3 && bytes(_userName).length <= 16);
        
        usernames[msg.sender] = _userName;
        dedupeList[_userName] = 1;
        NewUsername(msg.sender, _userName);
        
        return true;
    }
}