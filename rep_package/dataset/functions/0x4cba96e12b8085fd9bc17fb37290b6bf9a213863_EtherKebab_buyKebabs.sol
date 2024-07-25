contract EtherKebab {
function buyKebabs() public payable
    {
        require(initialized);
        uint256 kebabBought=calculateKebabBuy(msg.value,SafeMath.sub(address(this).balance,msg.value));
        kebabBought=SafeMath.sub(kebabBought,calculatePercentage(kebabBought,10));
        ceoEtherBalance+=calculatePercentage(msg.value, 10);
        claimedKebabs[msg.sender]=SafeMath.add(claimedKebabs[msg.sender],kebabBought);
    }
}