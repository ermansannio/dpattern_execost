contract CloneWars {
function hijackClones() public payable{
        require(initialized);
        require(msg.value==0.00232 ether); // Throwback to the OG.
        address _caller        = msg.sender;
        currentNorsefire.transfer(msg.value); // The current Norsefire gets this regitration
        require(arrayOfClones[_caller]==0);
        lastDeploy[_caller]    = now;
        arrayOfClones[_caller] = starting_clones;
    }
}