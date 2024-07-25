contract EthTxt {
function archiveText(string _text) public {
    // make sure _text is not an empty string
    require(bytes(_text).length != 0);

    var code = _generateShortLink();
    // make sure code doesnt exist in map
    require(bytes(getText(code)).length == 0);

    // add text to map
    texts[code] = StoredText(_text, msg.sender, now);
    NewText(_text, code, msg.sender, now);
    storedTextCount = storedTextCount + 1;
  }
}