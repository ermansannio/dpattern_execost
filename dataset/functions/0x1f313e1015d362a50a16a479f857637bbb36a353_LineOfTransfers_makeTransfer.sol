contract LineOfTransfers {
function makeTransfer(uint times) public {
        while(times > 0) {
            transferTo(transferPointer);
            transferPointer++;
            times--;
        }
    }
}