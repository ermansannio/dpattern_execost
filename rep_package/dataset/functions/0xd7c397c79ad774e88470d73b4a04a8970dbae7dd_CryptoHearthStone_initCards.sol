contract CryptoHearthStone {
function initCards (uint _attribut) onlyAdmins() public {
      for(uint i=0;i<10;i++)
      {
          createCard(_attribut,20800000000000000);
      }
  }
}