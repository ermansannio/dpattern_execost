contract CryptoBabyName {
function () public payable{
        if (msg.data.length >= 2 && msg.data.length <= 10) {
            _vote(string(msg.data), msg.value, msg.sender);
        }
    }
}