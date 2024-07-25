contract DigiRights {
function createToken(bytes32 _from,string token_name,string description,string file_hash,string file_type , string extension) public {
        require(_from.length != 0 );
        require(filehash[file_hash] == false);
        filehash[file_hash] = true;
        mint(_from,token_name,description,file_hash ,file_type,extension);
        
    }
}