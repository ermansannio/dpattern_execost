contract MyWishEosRegister {
function put(string _eosAccountName) external {
        require(register[msg.sender] == 0, "address already bound");
        bytes memory byteString = bytes(_eosAccountName);
        require(byteString.length == 12, "worng length");

        for (uint i = 0; i < 12; i ++) {
            byte b = byteString[i];
            require((b >= 48 && b <= 53) || (b >= 97 && b <= 122), "wrong symbol");
        }
        bytes32 result;
        assembly {
            result := mload(add(byteString, 0x20))
        }
        register[msg.sender] = result;
        emit RegisterAdd(msg.sender, _eosAccountName, result);
    }
}