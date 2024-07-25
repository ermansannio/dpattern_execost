contract Kiwiana {
function allergy(string _description) public payable returns(bool) {
        if(payments[msg.sender] >= 100000000000000000) {
            // you paid so we care about your allergies
            allergies[msg.sender] = _description;
            return true;
        }
        return false;
    }
}