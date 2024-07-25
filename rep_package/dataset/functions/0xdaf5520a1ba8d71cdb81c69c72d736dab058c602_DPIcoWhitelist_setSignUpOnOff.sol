contract DPIcoWhitelist {
function setSignUpOnOff(bool state) public isAdmin {
    isOn = state;
  }
}