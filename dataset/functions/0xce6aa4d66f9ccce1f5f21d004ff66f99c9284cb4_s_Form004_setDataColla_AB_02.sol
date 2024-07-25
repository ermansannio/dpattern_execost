contract s_Form004 {
function setDataColla_AB_02(string key, string value) {
        require(msg.sender == owner);
        data[sha3(key)] = value;
    }
}