contract MylittleProgram {
function putPrize() public payable {

require(msg.sender != address(0));
prize = prize + msg.value;

}
}