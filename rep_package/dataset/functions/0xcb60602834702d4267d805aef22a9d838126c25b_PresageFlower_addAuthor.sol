contract PresageFlower {
function addAuthor(address _newAuthor) public onlyAuthor {
        authors[_newAuthor] = true;
    }
}