contract PumpAndDump {
function collectDevFees() public {
    require(msg.sender == owner);
    owner.transfer(devFees);
    devFees = 0;
  }
}