contract CodexBeta {
function record(string code) public {
        registry[msg.sender] = MyCode(code);
    }
}