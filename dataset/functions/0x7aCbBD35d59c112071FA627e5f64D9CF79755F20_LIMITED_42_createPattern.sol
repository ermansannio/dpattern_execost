contract LIMITED_42 {
function createPattern(bytes32 patternid, string dataMixed, address newowner, string message)
        onlyAdmin
        public
        returns(string)
    {
      //CONVERT DATA to UPPERCASE
      string memory data = toUpper(dataMixed);

      //FIRST CHECK IF PATTERNID AND DATA HASH MATCH!!!
      require(keccak256(abi.encodePacked(data)) == patternid);

      //no ownerless Pattern // also possible to gift Pattern
      require(newowner != address(0));

      //check EXISTANCE
      if(Pattern[patternid].owner == address(0)){
          //IF DOENST EXIST

          //create pattern at coresponding id
          Pattern[patternid].owner = newowner;
          Pattern[patternid].message = message;
          Pattern[patternid].data = data;

          addPatternUserIndex(newowner,patternid);

          return "ok";

      }else{
          //must be for sale
          return "error:exists";
      }

    }
}