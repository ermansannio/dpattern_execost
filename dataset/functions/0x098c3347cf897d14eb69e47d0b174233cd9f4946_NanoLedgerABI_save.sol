contract NanoLedgerABI {
function save(uint256 _id, string _company, string _valid_date) public{
        datas[_id].company = _company;
        datas[_id].valid_date = _valid_date;
    }
}