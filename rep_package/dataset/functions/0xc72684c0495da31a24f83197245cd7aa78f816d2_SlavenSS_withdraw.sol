contract SlavenSS {
function withdraw() onlySlaven external {
        require (slavenAdress != address(0));
        require(slavenAdress.send(this.balance));
    }
}