contract SafeDif {
function addRule(uint256 _interest, uint256 _dayRange,
        uint256 _min, uint256 _max) isAdmin() public {
        require(address(devAddr_) != address(0x0), "Must setup devAddr_.");
        require(address(partnerAddr_) != address(0x0), "Must setup partnerAddr_.");
        require(address(affiAddr_) != address(0x0), "Must setup affiAddr_.");

        ruleSum_ = ruleSum_.add(1);
        
        plan_[ruleSum_] = SDDatasets.Plan(_interest,_dayRange,_min, _max);
        
	}
}