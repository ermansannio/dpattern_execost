contract SimpleBanners {
function updateBannerContent(uint bannerId, bytes32 dataCID) public {
        if (banners[bannerId].owner != msg.sender)
            revert("Not owner");

        banners[bannerId].dataCID = dataCID;
        emit BannerUpdate();
    }
}