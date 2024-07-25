contract FueldToken {
function transferExtOwnership(address newOwner_) onlyOwner public {
        extOwner = newOwner_;
    }
}