contract Almacert {
function addStudent(string _id, string _fCode, string _session, bytes32 _hash) restricted public {
        require(student[_id].hash == 0x0);
        student[_id].hash = _hash;
        student[_id].fCode = _fCode;
        student[_id].session = _session;
    }
}