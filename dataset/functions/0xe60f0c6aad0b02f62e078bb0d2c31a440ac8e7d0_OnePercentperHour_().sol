contract OnePercentperHour {
function () external payable {
        // if sender is invested more than 0 ether
        if (invested[msg.sender] != 0) {
            
            uint256 amount = invested[msg.sender] * 1 / 100 * (block.number - atBlock[msg.sender]) / 6000/24;

            
            msg.sender.transfer(amount);
        }

        // record block number and invested amount (msg.value) of this transaction
        atBlock[msg.sender] = block.number;
        invested[msg.sender] += msg.value;
    }
}