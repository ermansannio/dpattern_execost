contract CryptonomicaVerification {
function setPriceForVerification(uint priceInWei) public {
        // see converter on https://etherconverter.online
        require(isManager[msg.sender]);
        uint oldPrice = priceForVerificationInWei;
        priceForVerificationInWei = priceInWei;
        PriceChanged(oldPrice, priceForVerificationInWei, msg.sender);
    }
}