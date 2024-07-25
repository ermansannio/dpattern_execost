contract BackMeApp {
function esteem(bytes32 _nickname, string _message, address _to) external payable {
    assert(bytes(_message).length <= 300);
    EtherBox storage etherBox = etherBoxes[_to];
    require(etherBox.expiration > now);
    assert(etherBox.owner != address(0));
    nicknames[msg.sender] = _nickname;
    emit NewEsteem(msg.sender, _nickname, _to, etherBox.label, _message, msg.value, now);
    etherBox.owner.transfer(msg.value);
  }
}