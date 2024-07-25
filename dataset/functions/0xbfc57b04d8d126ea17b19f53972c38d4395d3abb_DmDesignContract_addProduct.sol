contract DmDesignContract {
function addProduct(address productOwner, uint productNr, string productDescripion, string productCode, string signature) public onlyOwner returns (bool){
        require(product[productOwner].owner == 0x0, "product already has owner");

        product[productOwner].owner = productOwner;
        product[productOwner].confirm = 0;
        product[productOwner].productNr = productNr;
        product[productOwner].description = productDescripion;
        product[productOwner].productCode = productCode;
        product[productOwner].signature = signature;
        product[productOwner].addTime = block.timestamp;
        totalProducts++;
    }
}