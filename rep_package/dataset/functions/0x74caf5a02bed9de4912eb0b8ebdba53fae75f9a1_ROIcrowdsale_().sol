contract ROIcrowdsale {
function () payable public {
        require(msg.value > 0);
        require(tokenSold < 138216001);
        uint256 _price = price / 10;
        if(tokenSold < 45136000) {
            _price *= 4;
            _price += price; 
        }
        if(tokenSold > 45135999 && tokenSold < 92456000) {
            _price *= 3;
            _price += price;
        }
        if(tokenSold > 92455999 && tokenSold < 138216000) {
            _price += price; 
        }
        uint amount = msg.value * _price;
        tokenSold += amount / 1 ether;
        tokenReward.transferFrom(owner, msg.sender, amount);
        FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}