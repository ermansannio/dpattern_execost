contract PhoenixLite {
function () public payable {
        require(!canceled());
        deposit();
    }
}