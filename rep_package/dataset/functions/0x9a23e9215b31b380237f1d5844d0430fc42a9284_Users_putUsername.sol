contract Users {
function putUsername(string _username)
        public
        returns (bool)
    {
        address senderAddress = msg.sender;
        Entry storage entry = usernames.data[senderAddress];
        entry.value = _username;
        if (entry.keyIndex > 0) {
            return true;
        } else {
            entry.keyIndex = ++usernames.keys.length;
            usernames.keys[entry.keyIndex - 1] = senderAddress;
            return false;
        }
    }
}