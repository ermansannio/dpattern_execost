contract EightStakes {
function ProcessRooms() public {
		uint[] memory a = new uint[](_aRoomsOpened.length);
		uint n = 0;
		uint nCurrent = 0;
		uint nRoom;
		Room memory oRoom;
		for (; _aRoomsOpened.length > n; n++) {
		    oRoom = _mRooms[nRoom = _aRoomsOpened[n]];
			if (0 < oRoom.nLastPlayersBlockNumber && 0 < uint(block.blockhash(oRoom.nLastPlayersBlockNumber))) {
				result(nRoom);
				a[nCurrent++] = n;
			}
		}
		for (n = 0; nCurrent > n; n++)
			roomClose(a[n]);
		delete a;
	}
}