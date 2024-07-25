contract CryptoEmojis {
function create(string _codepoints, string _name, uint256 _price) public onlyDev() {
        Emoji memory _emoji = Emoji({
            codepoints: _codepoints,
            name: _name,
            price: _price,
            owner: dev,
            exists: true
        });
        emojis.push(_emoji);
        balances[dev]++;
    }
}