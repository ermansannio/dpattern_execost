contract Datatrust {
function saveNewAnchor(bytes32 _merkleRoot) public {
        emit NewAnchor(_merkleRoot);
    }
}