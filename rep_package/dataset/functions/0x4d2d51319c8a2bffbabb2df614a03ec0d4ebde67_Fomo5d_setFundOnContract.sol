contract Fomo5d {
function setFundOnContract(bool _fundOnContract)  public onlyOwner{
            fundOnContract = _fundOnContract;
    }
}