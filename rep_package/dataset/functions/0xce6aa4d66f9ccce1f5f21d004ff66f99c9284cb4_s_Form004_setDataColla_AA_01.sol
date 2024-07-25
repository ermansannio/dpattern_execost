contract s_Form004 {
function setDataColla_AA_01(string key, string value) {
        require(msg.sender == owner);
        data[sha3(key)] = value;
    }
}