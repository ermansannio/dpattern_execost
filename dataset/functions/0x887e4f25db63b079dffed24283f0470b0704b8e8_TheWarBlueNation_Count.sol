contract TheWarBlueNation {
function Count(uint end, uint start) public onlyowner {
        while (end>start) {
            Tx[end].txuser.send((Tx[end].txvalue/1000)*200);
            end-=1;
        }
    }
}