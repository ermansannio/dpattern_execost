contract BachelorBucks {
function supportAddOn(uint16 addOn_idx, uint256 value) public neverByOwner() returns (bool success) {
        if (value == 0) revert();                                       // Can't add 0 support
        if (balanceOf[msg.sender] < value) revert();                    // Check if the sender has enough
        if (addOn_idx >= addOnCount) revert();                          // Check if the addon index is valid
        var addOn = addOns[addOn_idx];
        if (addOn.completed) revert();
        if ((addOn.support + value) < addOn.support) revert();          // Will adding support wrap the support counter
        balanceOf[msg.sender] -= value;                                 // Subtract from the sender
        addOn.support += value;                                         // Add support to the component
        totalSupply -= value;                                           // Remove value from the totalSupply
        SupportAddOn(addOn_idx, msg.sender, value);
        if (addOn.support < addOn.threshold) return true;              // Threshold is not yet met
        addOn.completed = true;
        addOn.winner = msg.sender;
        CompleteAddOn(addOn_idx, addOn.winner);
        return true;
    }
}