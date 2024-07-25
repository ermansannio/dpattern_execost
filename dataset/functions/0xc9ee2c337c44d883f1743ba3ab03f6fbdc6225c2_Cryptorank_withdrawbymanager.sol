contract Cryptorank {
function withdrawbymanager() public{
         
         require(msg.sender == manager);
         
         uint256 fundvalue = fund;
         
         fund = 0;
         
         manager.transfer(fundvalue);
     }
}