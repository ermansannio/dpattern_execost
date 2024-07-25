contract FreeTaxManFarmer {
function pepFarm(address item_shop_address, address token_address, uint256 buy_amount) nonReentrant external {
        for (uint8 i = 0; i < buy_amount; i++) {
            CornFarm(item_shop_address).buyObject(this);
        }
        userInventory[msg.sender][token_address].workDone = userInventory[msg.sender][token_address].workDone.add(uint256(buy_amount * 10**18));
    }
}