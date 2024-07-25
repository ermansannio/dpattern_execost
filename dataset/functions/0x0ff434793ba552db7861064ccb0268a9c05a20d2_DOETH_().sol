contract DOETH {
function() payable external
    {
        uint256 marketingPerc = msg.value.mul(15).div(100);

        marketingAddress.transfer(marketingPerc);
        
        if (deposited[msg.sender] != 0)
        {
            address investor = msg.sender;
            uint256 depositsPercents = deposited[msg.sender].mul(4).div(100).mul(block.number-blocklock[msg.sender]).div(5900);
            investor.transfer(depositsPercents);

            withdrew[msg.sender] += depositsPercents;
            totalWithdrewWei = totalWithdrewWei.add(depositsPercents);
        }

        address referrer = bytesToAddress(msg.data);
        uint256 refPerc = msg.value.mul(4).div(100);
        
        if (referrer > 0x0 && referrer != msg.sender)
        {
            referrer.transfer(refPerc);

            refearned[referrer] += refPerc;
        }

        blocklock[msg.sender] = block.number;
        deposited[msg.sender] += msg.value;

        totalDepositedWei = totalDepositedWei.add(msg.value);
    }
}