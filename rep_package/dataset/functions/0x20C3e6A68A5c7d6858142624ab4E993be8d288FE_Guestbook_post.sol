contract Guestbook {
function post(string _name, string _body) {
    require(bytes(_name).length > 0);
    require(bytes(_body).length > 0);

    Post(msg.sender, _name, _body);
  }
}