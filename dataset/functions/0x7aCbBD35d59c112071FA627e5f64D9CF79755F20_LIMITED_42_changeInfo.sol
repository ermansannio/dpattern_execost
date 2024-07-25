contract LIMITED_42 {
function changeInfo(string newinfo)
      public
      onlyAdmin
    {
      //only admin can call this.
      //require(msg.sender == admin); used modifier

      info = newinfo;
    }
}