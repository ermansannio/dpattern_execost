contract Kiwiana {
function giveMeBackMyMoney() public onlyOwner {
        //send all money to chris
        chris.transfer(address(this).balance);
    }
}