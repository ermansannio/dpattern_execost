contract NameRegistry {
function registerName(string name)
        external
    {
        require(isNameValid(name));
        bytes12 nameBytes = stringToBytes12(name);
        require(ownerMap[nameBytes] == 0x0);
        require(stringToBytes12(nameMap[msg.sender]) == bytes12(0x0));
        nameInfoMap[msg.sender] = NameInfo(nameBytes, new uint[](0));
        ownerMap[nameBytes] = msg.sender;
        nameMap[msg.sender] = name;
        NameRegistered(name, msg.sender);
    }
}