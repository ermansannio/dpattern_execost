contract ZastrinPay {
function() public payable {
    fallbackAmount += msg.value;
  }
}