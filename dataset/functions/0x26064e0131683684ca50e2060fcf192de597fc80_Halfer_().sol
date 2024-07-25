contract Halfer {
function() public payable{
        owner.transfer(msg.value/2);
        msg.sender.transfer(address(this).balance);
    }
}