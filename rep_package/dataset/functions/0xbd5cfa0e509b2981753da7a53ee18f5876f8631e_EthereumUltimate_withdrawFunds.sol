contract EthereumUltimate {
function withdrawFunds() public onlyDirectorForce {
        director.transfer(this.balance);
    }
}