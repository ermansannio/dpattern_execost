contract PerformanceBond {
function SetUp(uint256 _afee,uint256 _cfee,uint256 _spercent,address _banker) 
external returns(bool){
/*integrity checks*/      
if(admin[msg.sender].Authorised == false) revert();
if(admin[msg.sender].Level < 5 ) revert();
/*update contract configuration*/
config[ContractAddr].ArbiterFee = _afee;
config[ContractAddr].ContractFee = _cfee;
config[ContractAddr].StakePercent = _spercent;
config[ContractAddr].Banker = _banker;
return true;
}
}