contract CloneWars {
function sellIdeas() public {
        require(initialized);
        
        address _caller = msg.sender;
        
        uint256 hasIdeas        = getMyIdeas();
        uint256 ideaValue       = calculateIdeaSell(hasIdeas);
        uint256 fee             = devFee(ideaValue);
        // Destroy a quarter the owner's clones when selling ideas thanks to market saturation.
        arrayOfClones[_caller]  = (arrayOfClones[msg.sender].div(4)).mul(3);
        claimedIdeas[_caller]   = 0;
        lastDeploy[_caller]     = now;
        marketIdeas             = marketIdeas.add(hasIdeas);
        currentNorsefire.transfer(fee);
        _caller.transfer(ideaValue.sub(fee));
    }
}