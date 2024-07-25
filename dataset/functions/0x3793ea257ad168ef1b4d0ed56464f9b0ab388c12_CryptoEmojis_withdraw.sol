contract CryptoEmojis {
function withdraw() public onlyDev() {
        dev.transfer(address(this).balance);
    }
}