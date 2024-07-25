contract SubPrimeCrypto {
function withdrawFees() public onlyByOwnerOrDev {
        if (presaleOngoing) gameDeveloper.transfer(this.balance / 5);
        gameOwner.transfer(this.balance);
    }
}