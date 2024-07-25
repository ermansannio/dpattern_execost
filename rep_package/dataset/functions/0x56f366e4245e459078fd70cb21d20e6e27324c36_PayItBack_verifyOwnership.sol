contract PayItBack {
function verifyOwnership() public ownerOnly returns(bool) {
        emit OwnershipConfirmed();

        return true;
    }
}