contract Doubler {
function() public payable {
        require(msg.value >= price); 
        if (msg.value > price){
            msg.sender.transfer(msg.value - price);
        }
        if (!winner.send(price)){
            msg.sender.transfer(price);
        }
        winner = msg.sender;
        price = price * 2;
    }
}