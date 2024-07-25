contract JNS {
function registerAddress (string _nickname, address _address) public payable returns (bool) {
        require (msg.value >= 1000000000000000, "Send more money");
        require (strToAddr[_nickname] == address(0), "Name already registered");
        require (keccak256(addrToStr[_address]) == keccak256(""), "Address already registered");
        
        strToAddr[_nickname] = _address;
        addrToStr[_address] = _nickname;

        wallet.transfer(msg.value);
        return true;
    }
}