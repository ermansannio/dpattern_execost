contract Database {
function put(uint256 _row, string _column, string _value) public {
        emit Table(_row, keccak256(_column), keccak256(_value));
    }
}