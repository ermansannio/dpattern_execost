contract mhethkeeper {
function Finalize() public{
        if (!isFinalized && (msg.sender == owner)){
            isFinalized = true;
        } else {
            revert();
        }
    }
}