contract BankOfStephen {
function withdraw() public{
    require(owner['Stephen'] == msg.sender);
    msg.sender.transfer(address(this).balance);
}
}