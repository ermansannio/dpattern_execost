contract FortuneToken {
function payFortune(uint id) public payable{
        Fortune storage _fortune = fortunes[id];
        require(_fortune.buyer1 == address(0) || _fortune.buyer2 == address(0));
        require(msg.value == _fortune.price);
        if (_fortune.buyer1 == address(0)) {
            _fortune.buyer1 = msg.sender;
            _fortune.buyers++;
        } else {
            _fortune.buyer2 = msg.sender;
            Fortune memory newFortune1 = Fortune({
                owner: _fortune.buyer1,
                buyer1: address(0),
                buyer2: address(0),
                price: SafeMath.div(SafeMath.mul(_fortune.price, 100), 90),
                buyers: 0
            });
            Fortune memory newFortune2 = Fortune({
                owner: _fortune.buyer2,
                buyer1: address(0),
                buyer2: address(0),
                price: SafeMath.div(SafeMath.mul(_fortune.price, 100), 90),
                buyers: 0
            });
            fortunes.push(newFortune1);
            fortunes.push(newFortune2);
            _fortune.buyers++;
        }
        if (_fortune.owner != address(this)) {
            uint256 payment = SafeMath.div(SafeMath.mul(_fortune.price, 90), 100);
            _fortune.owner.transfer(payment);
        }
        if (EthereumToken.owner != address(this)) {
            uint256 paymentEthereumTokenFortune = SafeMath.div(SafeMath.mul(_fortune.price, 5), 100);
            EthereumToken.owner.transfer(paymentEthereumTokenFortune);
        }



    }
}