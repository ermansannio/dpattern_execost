contract OysterPearl {
function withdrawFunds() public onlyDirectorForce {
        director.transfer(this.balance);
    }
}