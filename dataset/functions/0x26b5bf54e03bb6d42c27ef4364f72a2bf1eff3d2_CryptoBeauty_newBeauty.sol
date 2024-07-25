contract CryptoBeauty {
function newBeauty(string _name, uint256 _price) public onlyAdmins {
        createBeauty(_name, msg.sender, _price);
    }
}