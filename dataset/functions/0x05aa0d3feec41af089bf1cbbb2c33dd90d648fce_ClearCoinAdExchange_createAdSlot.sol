contract ClearCoinAdExchange {
function createAdSlot(
        string domain,
        uint256 creative_type,
        uint256 min_cpc,
        uint256[] categories
    ) public {
        ad_slots[msg.sender] = AdSlot({
            domain: domain,
            creative_type: creative_type,
            min_cpc: min_cpc,
            categories: categories,
            avg_ad_quality: 100, // starts at 100% by default
            active: true
        });

        emit adSlotActivated(msg.sender);
    }
}