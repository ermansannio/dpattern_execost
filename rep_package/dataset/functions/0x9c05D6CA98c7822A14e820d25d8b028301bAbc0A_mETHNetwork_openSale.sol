contract mETHNetwork {
function openSale() public onlyDirector returns (bool success) {
        // The sale must be currently closed
        require(saleClosed);
        
        // Unlock the contribution
        saleClosed = false;
        return true;
    }
}