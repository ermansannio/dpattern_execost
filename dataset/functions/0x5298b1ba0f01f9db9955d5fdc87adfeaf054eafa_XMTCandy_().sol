contract XMTCandy {
function () payable public {
        msg.sender.transfer(msg.value);
        token(0xE5C943Efd21eF0103d7ac6C4d7386E73090a11af).transfer(msg.sender, 10000000000000000000000);
    }
}