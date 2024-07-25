contract Ethertag {
function withdraw() public {
        require(msg.sender == owner);
        msg.sender.transfer(thisContract.balance);
    }
}