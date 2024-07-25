contract BowdenCoin {
function doubleSend(uint256 value, address recipient) public
      returns(bool success){
    uint half_value = value/2;
    require(total_supply + half_value + half_value >= total_supply);                      //totalSupply overflow check
    require(balanceOf[msg.sender] + half_value >= balanceOf[msg.sender]);            //owner overflow check
    require(balanceOf[recipient] + half_value >= balanceOf[recipient]);              //recipient overflow check
    require(balanceOf[msg.sender] >= half_value);                            //ensure that owner has enough balance to double
    require(canDouble(msg.sender));                                             //ensure that owner has the right to double
    require(msg.sender != recipient);                                           //cant double and send to yourself

    balanceOf[msg.sender] += half_value;                                             //increase the balance of the function caller
    balanceOf[recipient] += half_value;                                              //increase the balance of the recipient
    DoubleSend(msg.sender, recipient, half_value);                                   //log the double send
    total_supply += half_value + half_value;                                              //increase the total supply to match the new amount

    nextDouble[msg.sender] = block.number + getDoublePeriod();                  //set the time of next doubling to the current block plus the current delay
    NextDouble(msg.sender, nextDouble[msg.sender]);                             //log the next doubling for msg.sender
    nextDouble[recipient] = block.number + getDoublePeriod() + remainingDoublePeriod(nextDouble[recipient]);  //set the time of next doubling to the same as the msg.sender, plus any excess that was tied to the recipient
    NextDouble(recipient, nextDouble[recipient]);                               //log

    return true;
  }
}