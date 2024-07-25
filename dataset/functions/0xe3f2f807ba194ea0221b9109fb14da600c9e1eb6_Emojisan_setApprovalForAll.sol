contract Emojisan {
function setApprovalForAll(address operator, bool value) external {
        isApprovedForAll[msg.sender][operator] = value;
        emit ApprovalForAll(msg.sender, operator, value);
    }
}