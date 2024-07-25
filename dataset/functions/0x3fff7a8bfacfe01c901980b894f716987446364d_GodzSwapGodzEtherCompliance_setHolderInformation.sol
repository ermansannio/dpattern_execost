contract GodzSwapGodzEtherCompliance {
function setHolderInformation(address _swapContract)
    {    
        /*if the owner is setting the information of the holder and the swap*/
        if (msg.sender==owner)
        {
            /*address of the swap contract*/
            swapContract = _swapContract;
        }
    }
}