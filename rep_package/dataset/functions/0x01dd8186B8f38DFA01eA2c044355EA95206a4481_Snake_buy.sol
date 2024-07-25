contract Snake {
function buy(uint256 id) external payable {
        require(snake[id] > 0); // must be a valid token
        require(msg.value >= snake[id] / 100 * 150); // must send enough ether to buy it
        address owner = owners[id];
        uint256 amount = snake[id];

        snake[id] = amount / 100 * 150; // set new price of token
        owners[id] = msg.sender; // set new owner of token
        stamps[id] = uint256(now); // set timestamp of last trade of token to now

        owner.transfer(amount / 100 * 125); // transfer investment+gain to previous owner. 
        Sale(owner, amount, uint256(now)); // broadcast Sale event to the 'chain
        // if this is the head token being traded:
        if (id == 0) { 
            length++; // increase the length of the snake
            _extend(length); // create new token
        }
        ownerAddress.transfer(this.balance); // transfer remnant to contract owner, no ether should be stored in contract
    }
}