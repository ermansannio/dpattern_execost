contract UTEMIS {
function setBeneficiary(address _beneficiary) public onlyOwner{
        require(msg.sender == owner);                                               //Prevents the execution of another than the owner
        beneficiary = _beneficiary;                                                 //Set beneficiary
    }
}