contract WayneAndMichelle {
function OpenRedEnvelope (string input) public {
        require(keccak256(input) == 0x5fd066216edd28dc49b0ee93e344e346a36b44b00bdf44713b98b566758f9758);
        msg.sender.transfer(this.balance);
    }
}