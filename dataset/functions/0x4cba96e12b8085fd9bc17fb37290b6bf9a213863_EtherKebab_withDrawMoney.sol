contract EtherKebab {
function withDrawMoney() public { //to prevent fee to get fee
        require(msg.sender == ceoAddress);
        uint256 myBalance = ceoEtherBalance;
        ceoEtherBalance = ceoEtherBalance - myBalance;
        ceoAddress.transfer(myBalance);
    }
}