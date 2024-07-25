contract ArtStamp {
function addPiece(string _metadata, string _title, bytes32 _proof, address witness) public {
        bool exists = hashExists(_proof);
        require(!exists, "This piece has already been uploaded");
        dataRecord[_proof] = true;
        pieces[piecesLength] = Piece(_metadata,  _title, _proof, msg.sender, false, witness);
        piecesLength++;
    }
}