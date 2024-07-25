contract Kiwiana {
function register(address _attendee) public payable returns(bool) {
        uint weiAmount = msg.value;
        if(weiAmount >= 100000000000000000) {
            payments[_attendee] = weiAmount;
            return true;
        }
        else {
            // you didn't pay enough, so we're just swallowing how much you spent
            return false;
        }
    }
}