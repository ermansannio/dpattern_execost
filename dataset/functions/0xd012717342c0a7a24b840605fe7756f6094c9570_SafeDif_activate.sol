contract SafeDif {
function activate() isAdmin() public {
        require(address(devAddr_) != address(0x0), "Must setup devAddr_.");
        require(address(partnerAddr_) != address(0x0), "Must setup partnerAddr_.");
        require(address(affiAddr_) != address(0x0), "Must setup affiAddr_.");

        require(activated_ == false, "Only once");
        activated_ = true ;
	}
}