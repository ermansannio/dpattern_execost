contract Alias {
function resetAlias() public {
        require(aliasAddressUsedMapping[msg.sender]);

        string memory name = aliasAddressMapping[msg.sender];
        aliasNameUsedMapping[name] = false;
        aliasAddressUsedMapping[msg.sender] = false;
    }
}