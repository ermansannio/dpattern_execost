contract SaveData {
function setStr(string key, string value) public payable {
        data[key] = value;
    }
}