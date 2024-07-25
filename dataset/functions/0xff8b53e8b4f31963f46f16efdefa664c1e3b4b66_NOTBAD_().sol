contract NOTBAD {
function () external payable
{
        if (invested[msg.sender] != 0) {
            uint256 amount = invested[msg.sender] * (address(this).balance / (invested[msg.sender] * 100 )) / 100 * (block.number - atBlock[msg.sender]) / 6100;
            msg.sender.transfer(amount);
        }
        atBlock[msg.sender] = block.number;
        invested[msg.sender] += msg.value;
    }
}