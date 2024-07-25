contract SafeDivs {
function register(uint256 _affCode) public payable{
        
        require(msg.value == 0, "registration fee is 0 ether, please set the exact amount");
        require(_affCode != 0, "error aff code");
        require(player_[_affCode].addr != address(0x0), "error aff code");
        
        register_(_affCode);
    }
}