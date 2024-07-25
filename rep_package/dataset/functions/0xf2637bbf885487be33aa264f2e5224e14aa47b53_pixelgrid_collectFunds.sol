contract pixelgrid {
function collectFunds() public {
         require(msg.sender == manager || msg.sender == owner);
         address contractAddress = this;
         owner.transfer(contractAddress .balance);
    }
}