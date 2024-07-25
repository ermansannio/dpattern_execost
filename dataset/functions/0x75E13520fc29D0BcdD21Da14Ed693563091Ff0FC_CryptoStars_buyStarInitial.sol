contract CryptoStars {
function buyStarInitial(uint starIndex, string strSTRZName) payable {
         
    // We only allow the Nextavailable star to be sold 
        if (starIndex > MaxStarIndexAvailable) throw;     //Above Current Offering Range
        if (starIndex < MinStarIndexAvailable) throw;       //Below Current Offering Range
        if (starIndexToAddress[starIndex] != 0x0) throw;    //Star is already owned
        if (msg.value < initialPrice) throw;               // Didn't send enough ETH
        
        starIndexToAddress[starIndex] = msg.sender;   
        starIndexToSTRZName[starIndex] = strSTRZName;      //Assign the star to new owner
        
        balanceOf[msg.sender]++;                            //Update the STRZ token balance for the new owner
        pendingWithdrawals[owner] += msg.value;

        string STRZMasterName = starIndexToSTRZMasterName[starIndex];
        StarBought(starIndex, msg.value, owner, msg.sender, strSTRZName, STRZMasterName ,MinStarIndexAvailable, MaxStarIndexAvailable);

        Assign(msg.sender, starIndex, starIndexToSTRZName[starIndex], starIndexToSTRZMasterName[starIndex]);
        //Assign(msg.sender, starIndex);
    }
}