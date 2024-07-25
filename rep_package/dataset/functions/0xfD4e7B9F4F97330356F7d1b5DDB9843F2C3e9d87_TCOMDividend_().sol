contract TCOMDividend {
function () public payable {
        dividendPerToken += msg.value / totalSupply;  // ignoring remainder
    }
}