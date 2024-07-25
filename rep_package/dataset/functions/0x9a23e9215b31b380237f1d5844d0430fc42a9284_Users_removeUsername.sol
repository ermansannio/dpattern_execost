contract Users {
function removeUsername()
        public
        returns (bool)
    {
        address senderAddress = msg.sender;
        Entry storage entry = usernames.data[senderAddress];
        if (entry.keyIndex == 0) {
            return false;
        }

        if (entry.keyIndex <= usernames.keys.length) {
            // Move an existing element into the vacated key slot.
            usernames.data[usernames.keys[usernames.keys.length - 1]].keyIndex = entry.keyIndex;
            usernames.keys[entry.keyIndex - 1] = usernames.keys[usernames.keys.length - 1];
            usernames.keys.length -= 1;
            delete usernames.data[senderAddress];
            return true;
        }
    }
}