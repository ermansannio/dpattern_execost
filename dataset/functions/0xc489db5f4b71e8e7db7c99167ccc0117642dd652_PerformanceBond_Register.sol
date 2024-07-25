contract PerformanceBond {
function Register(address arbiter_, bool authority_) external 
returns(bool) {
/*integrity checks*/      
if(admin[msg.sender].Authorised == false) revert();
if(admin[msg.sender].Level < 5 ) revert();
/*register arbitrator*/
arbiter[arbiter_].Registered = authority_; 
return true;
}
}