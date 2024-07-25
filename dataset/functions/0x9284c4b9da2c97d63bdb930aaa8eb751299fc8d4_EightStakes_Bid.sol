contract EightStakes {
function Bid(uint8 nRoomSize) public payable returns(bool) {
		uint8 nRoomType; //room type as a bit-flag value; size/bid: 0 for unused pair; 1 for 4/0.08, 2 for 4/0.8, 4 and 8 reserved, 16 for 8/0.08, 32 for 8/0.8, 64 for 8/8, 128 reserved
		int nRoomTypeIndx; //index from zero to four; size/bid: -1 for unused pair; 0 for 4/0.08, 1 for 4/0.8, 2 for 8/0.08, 3 for 8/0.8, 4 for 8/8
		(nRoomType, nRoomTypeIndx) = roomTypeGet(msg.value, nRoomSize);
		if (1 > nRoomType)
			revert();
		
		ProcessRooms();
		//check for rebid
		if (0 != _mPlayerRooms[msg.sender] & nRoomType)
			revert();
		_mPlayerRooms[msg.sender] |= nRoomType;
		uint nRoom = roomGet(msg.value, nRoomSize);
		Room memory oRoom = _mRooms[nRoom];
		uint nPlayer = 0;
		for (; oRoom.aPlayers.length > nPlayer; nPlayer++) {
		    if (1 > oRoom.aPlayers[nPlayer])
				break;
		    if (oRoom.aPlayers[nPlayer] == msg.sender)  
				revert();
		}
		uint nGas = msg.gas*800000000;
		if (0 < _mPlayers[msg.sender].oAddress) {
		    _mPlayers[msg.sender].dt = now;
			_mPlayers[msg.sender].nSpent += int(nGas);
			_mPlayers[msg.sender].aResults[uint(nRoomTypeIndx)] = 0;
		} else {
			_mPlayers[msg.sender] = Player(now, msg.sender, int(nGas), new int[](5));
			_aPlayersBinds.push(msg.sender);
		}
		_mPlayers[msg.sender].mGasByRoom[nRoom] = nGas;
		oRoom.aPlayers[nPlayer] = msg.sender;
		if (nPlayer + 1 == oRoom.aPlayers.length) {
			oRoom.nStart = now;
			oRoom.nLastPlayersBlockNumber = block.number;
		}
		_mRooms[nRoom] = oRoom;
		return true;
	}
}