contract ETHERKUN {
function getKun() external {
        uint id = kuns.push(kun(0, 0, now)) - 1;
        kunToOwner[id] = msg.sender;
    }
}