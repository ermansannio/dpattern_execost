contract ArtStamp {
function editPieceData(uint id, string newTitle, string newMetadata) public {
        bool ownership = hasOwnership(id);
        require(ownership, "You don't own this piece");
        pieces[id].metadata = newMetadata;
        pieces[id].title = newTitle;
    }
}