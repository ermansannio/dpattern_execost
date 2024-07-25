contract SubPrimeCrypto {
function setVariantCount(uint _houseClass, uint _variantCount) public onlyByOwnerOrDev {
        classVariants[_houseClass] = _variantCount;
    }
}