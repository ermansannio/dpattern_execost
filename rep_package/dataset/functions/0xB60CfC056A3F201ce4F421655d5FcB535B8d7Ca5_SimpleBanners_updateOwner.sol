contract SimpleBanners {
function updateOwner(address newOwner) public {
        if (msg.sender != owner)
            revert("Not the owner");

        owner = newOwner;
    }
}