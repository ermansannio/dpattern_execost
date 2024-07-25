contract DPIcoWhitelist {
function signUp() public signUpOpen newAddr {
    whitelist[msg.sender] = true;
    users.push(msg.sender);
  }
}