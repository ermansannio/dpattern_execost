contract CryptoPicture {
function 		setHashPiture( uint id, bytes32 hashPicture ) public {
		bytes32 	hash;

		assertProtectedEdit( id );

		hash = _cryptoPicture[id];
		setPicture( id, _namePicture[hash], hashPicture, _author[hash], _owner[hash] );
	}
}