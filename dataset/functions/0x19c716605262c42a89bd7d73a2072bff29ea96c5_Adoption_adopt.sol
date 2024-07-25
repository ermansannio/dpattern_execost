contract Adoption {
function adopt(uint pepeId) public payable returns (uint, uint) {
    require(pepeId >= 0 && pepeId <= 15);
    if ( data[pepeId].price == 20000000000000000 ) {
      data[pepeId].price = 40000000000000000;
    } else {
      data[pepeId].price = data[pepeId].price * 2;
    }
    
    require(msg.value >= data[pepeId].price * uint256(1));
    returnEth(data[pepeId].owner,  (data[pepeId].price / 10) * (9)); 
    fee(ceoAddress, (data[pepeId].price / 10) * (1));
    data[pepeId].owner = msg.sender;
    return (pepeId, data[pepeId].price);
    //return value;
  }
}