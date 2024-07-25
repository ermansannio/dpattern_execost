contract GetSomeEther {
function PutEther()
    public
    payable
    {
        uint256 newVal = freeEther+msg.value;
        if(newVal>freeEther)freeEther=newVal;
    }
}