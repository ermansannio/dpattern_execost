contract Contagion {
function() public payable {
        require(msg.value>=0.01 ether);
        Sort();
    }
}