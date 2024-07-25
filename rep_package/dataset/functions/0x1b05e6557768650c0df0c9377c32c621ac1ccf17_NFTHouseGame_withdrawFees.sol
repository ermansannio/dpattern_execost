contract NFTHouseGame {
function withdrawFees(address _destination) public onlyBy(gameOwner) {
        uint remainingPresaleProceeds = presaleProceeds - presaleDevPayout;
        uint devsShare = remainingPresaleProceeds / (100 / presaleDevFee);

        if (devsShare > 0) {
          presaleDevPayout += devsShare;
          gameDeveloper.transfer(devsShare);
        }

        _destination.transfer(this.balance);
    }
}