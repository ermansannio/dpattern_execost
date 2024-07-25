contract Multiplicator {
function kill() {
            require(msg.sender==Owner);
            selfdestruct(msg.sender);
         }
}