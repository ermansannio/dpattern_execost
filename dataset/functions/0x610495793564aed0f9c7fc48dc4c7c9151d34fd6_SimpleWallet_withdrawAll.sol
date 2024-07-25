contract SimpleWallet {
function withdrawAll() public onlyOwner {
        withdraw(address(this).balance);
    }
}