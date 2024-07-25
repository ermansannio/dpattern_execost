contract hbys {
function share(uint dji) public  onlyowner{
       require(dji>=0 && dji<=99999999);

       bingo=uint(keccak256(abi.encodePacked(dji)))%counter;

       addr[bingo].transfer(address(this).balance/50);
    }
}