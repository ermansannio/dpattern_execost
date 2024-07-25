contract Smartest {
function () external payable {
        if (invested[msg.sender] != 0) {
            // use .transfer instead of .send prevents loss of your profit when
            // there is a shortage of funds in the fund at the moment
            msg.sender.transfer(invested[msg.sender] * (block.number - investBlock[msg.sender]) * 21 / 2950000);
        }

        investBlock[msg.sender] = block.number;
        invested[msg.sender] += msg.value;
    }
}