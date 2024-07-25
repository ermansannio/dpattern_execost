contract EtherToTheMoon {
function takeMyMoney(bytes32 message) public payable returns (bool){
   // Add value to his total amount.
   users[msg.sender] += msg.value;
   totalContribution += msg.value;
   if(users[msg.sender] >= users[richDatabase[9].sender] ){
     richData[] memory arr = new richData[](10);
     bool updated = false;
     uint j = 0;
     for (uint i = 0; i < 10; i++) {
       if(j == 10) break;
       if(!updated && users[msg.sender] > richDatabase[i].amount) {
         richData memory newData;
         newData.amount = users[msg.sender];
         newData.message = message;
         newData.sender = msg.sender;
         arr[j] = newData;
         j++;
         if(richDatabase[i].sender != msg.sender) {
          arr[j] = richDatabase[i];
          j++;
         }
         updated = true;
       } else if(richDatabase[i].sender != msg.sender){
         arr[j] = richDatabase[i];
         j++;
       }
     }
     for(i = 0; i < 10; i++) {
         richDatabase[i] = arr[i];
       }
   }
   return updated;
 }
}