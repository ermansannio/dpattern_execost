contract BulkTransfer {
function () public payable {
        revert("Contract prohibits receiving funds");
    }
}