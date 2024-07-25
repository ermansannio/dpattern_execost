contract IRideICO {
function kill() isCreator public {
        selfdestruct(owner);
    }
}