contract DocumentaryContract {
function documentIt(uint128 refid, uint64 doctime, bytes32[] taghashes, string tags, string title, string text) public {
        writeDocument(refid, 0, doctime, taghashes, tags, title, text);
    }
}