contract Alias {
function setAlias(string _name) public {
        require(!aliasNameUsedMapping[_name]);
        require(!aliasAddressUsedMapping[msg.sender]);

        aliasNameUsedMapping[_name] = true;
        aliasAddressUsedMapping[msg.sender] = true;
        aliasNameMapping[_name] = msg.sender;
        aliasAddressMapping[msg.sender] = _name;
    }
}