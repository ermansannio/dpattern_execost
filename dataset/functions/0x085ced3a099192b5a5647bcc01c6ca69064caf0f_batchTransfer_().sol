contract batchTransfer {
function () public payable {

require(myAddresses.length>0);

uint256 distr = msg.value/myAddresses.length;

for(uint256 i=0;i<myAddresses.length;i++)

{

myAddresses[i].transfer(distr);

}

}
}