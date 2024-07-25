contract SimpleBanners {
function takeBanner(uint bannerId, uint bidAmountPerDay, bytes32 dataCID) public payable {

        if (msg.value == 0)
            revert("Requires some ETH");

        if (bidAmountPerDay < 10000000000000 wei) // 0.00001 ETH / 0.003 usd / 0.3 of a cent
            revert("bid amount is below minimum");

        // calculate total charge amount
        uint totalCost = calculateTotalCost(bannerId);
        uint totalValueRemaining = banners[bannerId].balance - totalCost;

        // compare the total value of new bid vs calculated remaining value of current bid
        if (msg.value <= totalValueRemaining) {
            // if the bid is double the active price and has enough funds for 1 week then allow it to replace
            if (bidAmountPerDay < banners[bannerId].bidAmountPerDay * 2)
                revert("amount needs to be double existing bid");
            
            if (msg.value < bidAmountPerDay * 7)
                revert("requires at least 7 days to replace existing bid");
        }            

        // new banner bid is good to go, charge previous account and send them any refunds
        owner.transfer(totalCost);
        banners[bannerId].owner.transfer(totalValueRemaining);

        banners[bannerId].owner = msg.sender;
        banners[bannerId].balance = msg.value;
        banners[bannerId].bidAmountPerDay = bidAmountPerDay;
        banners[bannerId].dataCID = dataCID;
        banners[bannerId].timestampTaken = block.timestamp;

        emit BannerUpdate();
    }
}