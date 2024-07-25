contract EtherMorty {
function buyIceDrangon() public payable {
        require(initialized);
        require(userHatchRate[msg.sender] != 0);
        uint dragonPrice = getDragonPrice(userHatchRate[msg.sender], address(this).balance) * 8;
        uint dragonAmount = SafeMath.div(msg.value, dragonPrice);
        require(dragonAmount > 0);
        
        ceoEtherBalance += calculatePercentage(msg.value, 40);
        iceDragons[msg.sender] += dragonAmount;
    }
}