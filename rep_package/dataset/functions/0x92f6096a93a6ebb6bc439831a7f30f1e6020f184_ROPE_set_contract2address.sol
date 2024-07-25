contract ROPE {
function set_contract2address(address _address) public{
        require(msg.sender == 0xb993cbf2e0A57d7423C8B3b74A4E9f29C2989160);
        contract2Address = _address;
    
    }
}