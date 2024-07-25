contract Ethertag {
function supportMessage(uint i) public payable {
        messages[i].value += msg.value;
        emit newSupport(i, messages[i].value);
    }
}