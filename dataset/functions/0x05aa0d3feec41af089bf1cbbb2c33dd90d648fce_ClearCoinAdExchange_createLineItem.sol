contract ClearCoinAdExchange {
function createLineItem(
        string destination_url,
        uint256 max_cpc,
        uint256 max_daily_spend,
        uint256 creative_type,
        uint256[] categories
    ) public {
        line_items[msg.sender] = LineItem({
            budget: 0,
            destination_url: destination_url,
            max_cpc: max_cpc,
            max_daily_spend: max_daily_spend,
            creative_type: creative_type,
            categories: categories,
            active: true
        });

        emit lineItemActivated(msg.sender);
    }
}