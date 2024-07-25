contract Cryptoraces {
function enter(uint256 leftorright) public payable {

      if(leftorright == 1) {
        maximumBalance = getMaximumBetRate();
        require(msg.value < maximumBalance && msg.value > .001 ether,"Your bet is too high!");

        rewardnumber = randomtests();
        if(rewardnumber < 45){
            msg.sender.transfer(msg.value.mul(2));
            members[msg.sender].time = now;
            members[msg.sender].luckNumber = rewardnumber;
            members[msg.sender].horseType = leftorright;
            listofUsers.push(msg.sender) -1;
        } else {

          members[msg.sender].time = now;
          members[msg.sender].luckNumber = rewardnumber;
          members[msg.sender].horseType = leftorright;
          listofUsers.push(msg.sender) -1;
        }
      } else {
        maximumBalance = getMaximumBetRate();
        require(msg.value < maximumBalance && msg.value > .001 ether,"Your bet is too high or low");

        rewardnumber = randomtests();
        if(rewardnumber > 55){
            msg.sender.transfer(msg.value.mul(2));

            members[msg.sender].time = now;
            members[msg.sender].horseType = leftorright;
            members[msg.sender].luckNumber = rewardnumber;
            listofUsers.push(msg.sender) -1;
        } else {

          members[msg.sender].time = now;
          members[msg.sender].horseType = leftorright;
          members[msg.sender].luckNumber = rewardnumber;
          listofUsers.push(msg.sender) -1;
        }
      }
    }
}