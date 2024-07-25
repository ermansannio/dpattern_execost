contract Fomo5d {
function transferOwner(address newOwner)  public onlyOwner{
        owner = newOwner;
    }
}