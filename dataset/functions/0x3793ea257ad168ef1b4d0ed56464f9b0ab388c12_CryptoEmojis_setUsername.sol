contract CryptoEmojis {
function setUsername(bytes16 _username) public {
        usernames[msg.sender] = _username;
        emit UsernameChange(msg.sender, _username);
    }
}