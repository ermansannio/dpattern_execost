contract TeamPerfitForwarder {
function setTeamPerfitAddr(address newTeamPerfitAddr) public onlyOwner {
        teamPerfitAddr = newTeamPerfitAddr;
    }
}