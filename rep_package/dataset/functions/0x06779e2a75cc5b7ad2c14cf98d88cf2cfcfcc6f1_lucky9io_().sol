contract lucky9io {
function () public payable {
        // Only accept ticket purchases if the game is ON
        require(game_alive == true);

        // Price of the ticket is 0.009 ETH
        require(msg.value / 1000000000000000 == 9);

        // House edge (15%) + Jackpot (85%)
        jackpot = jackpot + (msg.value * 85 / 100);
        house_edge = house_edge + (msg.value * 15 / 100);

        // Owner does not participate in the play, only adds up to the JACKPOT
        if(msg.sender == owner) return;

        // Add the ticket entry to the daily game
        if(entries_count >= entries_addresses.length) {
            entries_addresses.push(msg.sender);
            entries_blockhash.push(blockhash(block.number));
        } else {
            entries_addresses[entries_count] = msg.sender;
            entries_blockhash[entries_count] = blockhash(block.number);
        }
        entries_count++;
        total_tickets++;

        return;
    }
}