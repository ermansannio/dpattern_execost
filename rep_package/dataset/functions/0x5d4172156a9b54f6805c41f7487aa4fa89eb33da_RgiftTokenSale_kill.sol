contract RgiftTokenSale {
function kill() isCreator public {
        selfdestruct(owner);
    }
}