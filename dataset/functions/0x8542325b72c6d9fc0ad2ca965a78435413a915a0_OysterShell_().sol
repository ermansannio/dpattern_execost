contract OysterShell {
function () public payable {
        // Prevent ETH from getting sent to contract
        require(false);
    }
}