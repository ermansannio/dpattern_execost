contract PixelFactory {
function setUsername(string username) public {
        ownerToUsername[msg.sender] = username;
        emit Username(username);
    }
}