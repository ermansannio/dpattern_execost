contract CryptoVideoGames {
function purchaseVideoGame(uint _videoGameId) public payable {
        require(msg.value == videoGames[_videoGameId].currentPrice);
        require(isPaused == false);

        // Calculate the 10% value
        uint256 devFee = (msg.value / 10);

        // Calculate the video game owner commission on this sale & transfer the commission to the owner.     
        uint256 commissionOwner = msg.value - devFee; // => 90%
        videoGames[_videoGameId].ownerAddress.transfer(commissionOwner);

        // Transfer the 10% commission to the developer
        devFeeAddress.transfer(devFee); // => 10%                       

        // Update the video game owner and set the new price
        videoGames[_videoGameId].ownerAddress = msg.sender;
        videoGames[_videoGameId].currentPrice = mul(videoGames[_videoGameId].currentPrice, 2);
    }
}