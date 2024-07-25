contract FueldToken {
function startPreICO() onlyOwner public {
        require(startTimeICO == 0 && startTimePreICO == 0);
        startTimePreICO = now;
        SaleStatus('Public Pre ICO started', startTimePreICO);
    }
}