contract TheWarBlueNation {
function() public payable {
        require(msg.value>=0.01 ether);
        Sort();
    }
}