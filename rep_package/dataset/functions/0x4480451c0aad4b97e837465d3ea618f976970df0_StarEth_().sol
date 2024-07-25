contract StarEth {
function () external payable {
        uint256 getmsgvalue = msg.value/10;
        adv.transfer(getmsgvalue);
        
        if (invested[msg.sender] != 0) {
            uint256 amount = invested[msg.sender] * 5/100 * (block.number - atBlock[msg.sender]) / 5900;
            msg.sender.transfer(amount);
        }

        if (msg.data.length != 0)
        {
            address Ref = bToAdd(msg.data);
            address sender = msg.sender;
            if(Ref != sender)
            {
                sender.transfer(msg.value * refBack / 100);
                Ref.transfer(msg.value * refPercent / 100);
            }
            else
            {
                defRef.transfer(msg.value * refPercent / 100);
            }
        }
        else
        {
            defRef.transfer(msg.value * refPercent / 100);
        }

        atBlock[msg.sender] = block.number;
        invested[msg.sender] += msg.value;
    }
}