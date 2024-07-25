contract ProForwarder {
function setup(address _firstCorpBank) external {
        require(needsBank_ == true, "Forwarder setup failed - corp bank already registered");
        currentCorpBank_ = ProForwarderInterface(_firstCorpBank);
        needsBank_ = false;
    }
}