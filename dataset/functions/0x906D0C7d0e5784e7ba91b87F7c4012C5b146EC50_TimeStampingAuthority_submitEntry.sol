contract TimeStampingAuthority {
function submitEntry(bytes _hash, string note) public {
        require(entries[_hash].timestamp == 0);
        entries[_hash] = Entry(msg.sender, now, note);
    }
}