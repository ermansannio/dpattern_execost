contract IEFBR14Contract {
function IEFBR14()  public{
       // Ok, it does a little bit more than nothing :)
       IEF403I(msg.sender);
       users.push(msg.sender);
       IEF404I(msg.sender);       
   }
}