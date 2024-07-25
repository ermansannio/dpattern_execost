contract SMINT {
function bill(uint _amount) external {
        require(_amount > 0);
        invoices[currentInvoice] = Invoice({
            beneficiary: msg.sender,
            amount: _amount,
            payer: 0x0
        });
        Bill(currentInvoice);
        currentInvoice++;
    }
}