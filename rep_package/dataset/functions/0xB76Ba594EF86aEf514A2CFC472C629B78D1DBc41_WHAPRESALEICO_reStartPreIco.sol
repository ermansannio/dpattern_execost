contract WHAPRESALEICO {
function reStartPreIco() {
      require(!preIcoOpen); 
      require(beneficiary == msg.sender);
      preIcoOpen = true;
    }
}