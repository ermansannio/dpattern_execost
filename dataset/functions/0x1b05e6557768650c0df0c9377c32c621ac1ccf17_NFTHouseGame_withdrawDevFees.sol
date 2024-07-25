contract NFTHouseGame {
function withdrawDevFees(address _destination) public onlyBy(gameDeveloper) {
        uint remainingPresaleProceeds = presaleProceeds - presaleDevPayout;
        uint devsShare = remainingPresaleProceeds / (100 / presaleDevFee);

        if (devsShare > 0) {
          presaleDevPayout += devsShare;
          _destination.transfer(devsShare);
        }
    }
}