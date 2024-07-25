contract WhoTheEth {
function setName(string newName) payable public {
        require(msg.value >= 1 finney || numberOfNames < 500);
        numberOfNames++;
        names[msg.sender] = newName;
        bank[owner] += msg.value;
        AddedName(msg.sender, newName, now, owner, msg.value);
    }
}