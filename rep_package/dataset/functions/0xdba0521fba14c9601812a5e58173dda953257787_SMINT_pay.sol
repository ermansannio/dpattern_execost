contract SMINT {
function pay(uint _invoiceId) external {
        require(_invoiceId < currentInvoice);
        require(invoices[_invoiceId].payer == 0x0);
        _transfer(msg.sender, invoices[_invoiceId].beneficiary, invoices[_invoiceId].amount);
        invoices[_invoiceId].payer = msg.sender;
        Pay(_invoiceId);
    }
}