contract CloneWars {
function deployIdeas(address ref) public{
        
        require(initialized);
        
        address _deployer = msg.sender;
        
        if(referrals[_deployer] == 0 && referrals[_deployer] != _deployer){
            referrals[_deployer]=ref;
        }
        
        uint256 myIdeas          = getMyIdeas();
        uint256 newIdeas         = myIdeas.div(clones_to_create_one_idea);
        arrayOfClones[_deployer] = arrayOfClones[_deployer].add(newIdeas);
        claimedIdeas[_deployer]  = 0;
        lastDeploy[_deployer]    = now;
        
        // Send referral ideas: dropped to 5% instead of 20% to reduce inflation.
        if (arrayOfClones[referrals[_deployer]] > 0) 
        {
            claimedIdeas[referrals[_deployer]] = claimedIdeas[referrals[_deployer]].add(myIdeas.div(20));
        }
        
        // Boost market to minimise idea hoarding
        marketIdeas = marketIdeas.add(myIdeas.div(10));
    }
}