contract IRidePreICO {
function kill() isCreator public {
        selfdestruct(owner);
    }
}