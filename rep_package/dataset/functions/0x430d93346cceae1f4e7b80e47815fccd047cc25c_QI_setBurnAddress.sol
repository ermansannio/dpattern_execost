contract QI {
function setBurnAddress(address _toBurn) public onlyOwnerable returns(bool success) {
        
        burnAddress = _toBurn;
        return true;
    }
}