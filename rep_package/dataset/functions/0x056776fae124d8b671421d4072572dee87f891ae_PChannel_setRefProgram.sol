contract PChannel {
function setRefProgram(address _addr) public onlyOwner {
        refProgram = Referral(_addr);
    }
}