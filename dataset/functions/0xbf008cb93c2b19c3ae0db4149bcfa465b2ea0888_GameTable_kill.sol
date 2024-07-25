contract GameTable {
function kill() public {
       if (owner == msg.sender) { 
          selfdestruct(owner);
       }
    }
}