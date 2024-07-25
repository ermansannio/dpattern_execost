contract NanoLedger {
function saveCode(uint256 id, string dataMasuk) public{
        data[id] = dataMasuk;
    }
}