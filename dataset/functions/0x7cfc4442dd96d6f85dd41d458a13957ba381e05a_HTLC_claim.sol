contract HTLC {
function claim(string _hash) public returns(bool result) {
       require(digest == sha256(_hash));
       selfdestruct(dest);
       return true;
       }
}