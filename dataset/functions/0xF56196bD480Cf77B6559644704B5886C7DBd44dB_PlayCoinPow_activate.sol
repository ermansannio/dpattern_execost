contract PlayCoinPow {
function activate() onlyAdministrator() public {
        
        // can only be ran once
        require(activated_ == false, "PCP already activated");
        
        // activate the contract 
        activated_ = true;
    }
}