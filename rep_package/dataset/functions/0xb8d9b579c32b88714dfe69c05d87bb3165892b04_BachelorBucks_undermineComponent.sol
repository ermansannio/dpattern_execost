contract BachelorBucks {
function undermineComponent(uint16 component_idx, uint256 value) public neverByOwner() returns (bool success) {
        if (value == 0) revert();                                       // Can't subtract 0 support
        if (balanceOf[msg.sender] < value) revert();                    // Check if the sender has enough
        if (component_idx >= componentCount) revert();                  // Check if the component index is valid
        var component = components[component_idx];
        if ((component.currentSupport - int256(value)) > component.currentSupport) revert();  // Will subtracting this much support wrap the component support
        balanceOf[msg.sender] -= value;                                 // Subtract from the sender
        component.currentSupport -= int256(value);                      // Subtract support from the component
        component.undermined += value;
        totalSupply -= value;                                           // Remove value from the totalSupply
        UndermineComponent(component_idx, msg.sender, value);
        return true;
    }
}