contract Swap {
function claim(address _ethAddrReceiver, bytes32 _x, bytes32 _y, uint8 _v, bytes32 _r, bytes32 _s) public returns(bool) {
        require ( dataContract != address(0) );
        
		/* This code enable swap from BTC address compressed and uncompressed, check before compressed (more common format)
		 * and then also uncompressed address format - btc address is calculated in hex format without checksum and prefix
		 */
        address btcAddr0x; 
		btcAddr0x = address( btcAddrPubKeyCompr(_x,_y) ); 
		if( dataContract.CftBalanceOf( btcAddr0x ) == 0 || claimed[ btcAddr0x ] ) { //check if have balance of if is already claimed
			btcAddr0x = address( btcAddrPubKeyUncompr(_x,_y) ); 
		}
		
		require ( dataContract.CftBalanceOf( btcAddr0x ) != 0 );
        require ( !claimed[ btcAddr0x ] );
		
		address checkEthAddr0x = address( ethAddressPublicKey(_x,_y) ); //calculate eth address from pubkey for check of ecrecover function to verify sign
        require ( validateBSM( toAsciiString(_ethAddrReceiver), checkEthAddr0x, _v, _r, _s) ); // check if eth address of receiver is signed by owner of privkey
        
        //add 10 number after the dot, 1 satoshi = 10^8 | 1 wei = 10^18
        // the swap is 1:0,5
        uint256 tokenAmount = dataContract.CftBalanceOf(btcAddr0x) * 10**10 / 2; 
        
        claimed[btcAddr0x] = true;
        
        tokenContract.transfer(_ethAddrReceiver, tokenAmount);
        
        return true;
    }
}