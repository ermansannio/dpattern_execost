contract WhoTheEth {
function setNameRefer(string newName, address ref) payable public {
        require(msg.value >= 1 finney || numberOfNames < 500);
        require(msg.sender != ref);
        numberOfNames++;
        names[msg.sender] = newName;
        bank[owner] += msg.value / 10;
        bank[ref] += msg.value - (msg.value / 10);
        AddedName(msg.sender, newName, now, ref, msg.value);
    }
}