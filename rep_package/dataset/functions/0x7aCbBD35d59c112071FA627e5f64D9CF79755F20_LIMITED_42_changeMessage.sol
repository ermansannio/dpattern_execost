contract LIMITED_42 {
function changeMessage(bytes32 patternid,string message, uint8 v, bytes32 r, bytes32 s)
      public
      returns(string)
    {
      // just so we have somthing
      address owner = admin;

      //check that pattern in question has an owner
      require(Pattern[patternid].owner != address(0));

      //check if sender iis owner
      if(Pattern[patternid].owner == msg.sender){
        //if sender iiis owner
        owner = msg.sender;
      }else{
        // anyone else need to supply a new address signed by the old owner

        //generate the h for the new address
        bytes32 h = prefixedHash(message);
        owner = ecrecover(h, v, r, s);
      }

      require(Pattern[patternid].owner == owner);

      Pattern[patternid].message = message;

      return "ok";

    }
}