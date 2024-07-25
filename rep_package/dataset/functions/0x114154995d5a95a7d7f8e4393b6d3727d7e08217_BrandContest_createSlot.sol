contract BrandContest {
function createSlot(uint256 _slot, uint256 _price) public onlyCEO {
        require(msg.sender != address(0));
        slots[_slot] = Slot(_price, address(0));
    }
}