contract EtherMorty {
function withDrawMoney() public {
        require(msg.sender == ceoAddress);
        uint256 myBalance = ceoEtherBalance;
        ceoEtherBalance = 0;
        ceoAddress.transfer(myBalance);
    }
}