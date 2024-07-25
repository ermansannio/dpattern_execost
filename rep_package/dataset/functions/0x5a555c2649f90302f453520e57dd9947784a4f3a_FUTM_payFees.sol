contract FUTM {
function payFees() public {
         // Check state to see if swap needs to happen.
         _updateState();
         
        uint256 fees = penalty + (_submitted - submittedFeesPaid) * 1530 / 10000;  // fees are 15.3 % total.
        submittedFeesPaid = _submitted;
        
        reservedFees = 0;
        penalty = 0;
        
        if (fees > 0) 
        {
            foundation.transfer(fees / 2);
            owner.transfer(fees / 4);
            dev.transfer(fees / 4);
        }
    }
}