contract CryptoPicture {
function  	addPicture( string namePicture, bytes32 hashPicture, string author, address owner ) public {
		assertAdmin();
		assertId(_id);

		setPicture( _id, namePicture, hashPicture, author, owner );
		_id++;
	}
}