contract s_Form003 {
function setDataColla_001_001(string key, string value) {
        require(msg.sender == owner);
        data[sha3(key)] = value;
    }
}