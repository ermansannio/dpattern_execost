contract s_Form001 {
function setData(string key, string value) {
        require(msg.sender == owner);
        data[sha3(key)] = value;
    }
}