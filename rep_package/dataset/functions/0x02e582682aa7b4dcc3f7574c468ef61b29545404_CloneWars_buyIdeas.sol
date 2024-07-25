contract CloneWars {
function buyIdeas() public payable{
        require(initialized);
        address _buyer       = msg.sender;
        uint    _sent        = msg.value;
        uint256 ideasBought  = calculateIdeaBuy(_sent, SafeMath.sub(address(this).balance,_sent));
        ideasBought          = ideasBought.sub(devFee(ideasBought));
        currentNorsefire.transfer(devFee(_sent));
        claimedIdeas[_buyer] = claimedIdeas[_buyer].add(ideasBought);
    }
}