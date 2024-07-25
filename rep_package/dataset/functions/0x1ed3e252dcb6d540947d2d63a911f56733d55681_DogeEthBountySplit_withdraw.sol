contract DogeEthBountySplit {
function withdraw() public {
        uint balance = this.balance;
        uint oneThird = balance / 3;
        oscarGuindzbergAddress.transfer(oneThird);
        coinfabrikAddress.transfer(oneThird);
        truebitAddress.transfer(oneThird);
    }
}