contract Nicks {
function unset () public {
    require(bytes(nickOfOwner[msg.sender]).length > 0);

    address owner = msg.sender;
    string storage oldNick = nickOfOwner[owner];

    Unset(oldNick, owner);

    delete ownerOfNick[oldNick];
    delete nickOfOwner[owner];
  }
}