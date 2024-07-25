contract DocSigner {
function setup( string   newDocHash,
                    address[] newSigs )
        external
        onlyOwner
    {
        require( newSigs.length <= maxSigs ); // bound array

        docHash = newDocHash;
        numSigs = newSigs.length;

        for( uint i = 0; i < numSigs; i++ ){
            signatories[i] = newSigs[i];
        }
    }
}