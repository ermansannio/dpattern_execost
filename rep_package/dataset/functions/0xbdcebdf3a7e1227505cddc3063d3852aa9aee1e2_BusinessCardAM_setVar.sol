contract BusinessCardAM {
function setVar(string key, string value) {
        variables[sha3(key)] = value;
    }
}