contract SnailFarm2 {
function SellAcorns(uint256 _acorns) public {
        require(playerAcorns[msg.sender] > 0);
        
        playerAcorns[msg.sender] = playerAcorns[msg.sender].sub(_acorns);
        uint256 _acornEth = ComputeAcornPrice().mul(_acorns);
        totalAcorns = totalAcorns.sub(_acorns);
        treePot = treePot.sub(_acornEth);
        playerEarnings[msg.sender] = playerEarnings[msg.sender].add(_acornEth);
        
        emit SoldAcorn(msg.sender, _acorns, _acornEth);
    }
}