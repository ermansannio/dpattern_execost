contract LockYourLove {
function destroy() onlyOwner { // so funds not locked in contract forever
        selfdestruct(owner); // send funds to organizer
    }
}