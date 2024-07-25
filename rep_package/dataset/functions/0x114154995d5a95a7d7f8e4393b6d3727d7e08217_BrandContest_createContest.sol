contract BrandContest {
function createContest(string _key, uint256 _ticket_price) public onlyCEO {
        require(msg.sender != address(0));
        contests[_key] = Contest(true, _ticket_price, 0, address(0));
    }
}