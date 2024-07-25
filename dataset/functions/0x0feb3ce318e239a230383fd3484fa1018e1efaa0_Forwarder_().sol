contract Forwarder {
function() payable {
    if (!parentAddress.call.value(msg.value)(msg.data))
      throw;
    // Fire off the deposited event if we can forward it  
    ForwarderDeposited(msg.sender, msg.value, msg.data);
  }
}