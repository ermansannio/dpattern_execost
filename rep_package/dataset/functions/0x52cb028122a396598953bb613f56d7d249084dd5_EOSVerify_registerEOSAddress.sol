contract EOSVerify {
function registerEOSAddress(string eosAddress) public {
    assert(bytes(eosAddress).length <= 64);

    eosAddressBook[msg.sender] = eosAddress;

    emit LogRegisterEOSAddress(msg.sender, eosAddress);
  }
}