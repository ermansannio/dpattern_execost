contract Simple_SHA3_Test {
function test_withdraw() public {
        require(msg.sender == owner);
        msg.sender.transfer(address(this).balance);
    }
}